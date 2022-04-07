import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/thems/colors.dart';
import 'bloc/card_bloc.dart';
import 'bloc/card_event.dart';
import 'bloc/card_state.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: CartList(),
            ),
          ),
          const Divider(height: 4, color: Colors.black),
          CartTotal()
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemNameStyle = Theme.of(context).textTheme.headline6;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return ListView.separated(
            itemCount: state.cart.items.length,
            separatorBuilder: (_, __) => const Divider(thickness: 3,),
            itemBuilder: (context, index) {
              final item = state.cart.items[index];
              return Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children:[
                    Expanded(flex: 4,child: Text(item.title!, style: itemNameStyle)),
                Expanded(flex: 1,child: IconButton(
                  icon: Icon(
                      Icons.remove,
                      color:AppColors.primaryColor ,
                    ), onPressed: () { context.read<CartBloc>().add(CartItemRemoved(item));
                },
                ))],
                ),
              );
            },
          );
        }
        return const Text('Something went wrong!');
      },
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hugeStyle =
    Theme.of(context).textTheme.headline1?.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartLoading) {
                return const CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                return Text('\$${state.cart.totalPrice}', style: hugeStyle);
              }
              return const Text('Something went wrong!');
            }),
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buying not supported yet.')),
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}