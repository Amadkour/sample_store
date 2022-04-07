import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_store/core/thems/colors.dart';
import 'package:sample_store/module/product/data/model/ProductModel.dart';
import '../../../card/bloc/cart/card_bloc.dart';
import '../../../card/bloc/cart/card_event.dart';
import '../../../card/bloc/cart/card_state.dart';
import '../../../card/bloc/quantity/quantity_bloc.dart';
import '../../../card/bloc/quantity/quantity_event.dart';
import '../../../card/bloc/quantity/quantity_state.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_state.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductFailState) {
        return Text(state.message);
      } else if (state is ProductLoadingState) {
        ///-------------loading
        return Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ));
      } else if (state is ProductSuccessState) {
        ///--------------loading product Successfully
        return ProductListDesign(
          state: state,
        );
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    }));
  }
}

class QuantityDesign extends StatelessWidget {
  const QuantityDesign(
      {Key? key, required this.productModel, required this.isInCart})
      : super(key: key);
  final ProductModel productModel;
  final bool isInCart;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuantityBloc(
          quantity: productModel.observedQuantity!, max: productModel.stock!),
      child: BlocBuilder<QuantityBloc, QuantityState>(
        builder: (context, state) {
          if (state is QuantityMin) {
            ///--------------reach to minimum quantity
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),

                    ///decrease
                    InkWell(
                      radius: 5,
                      borderRadius: BorderRadius.circular(9),
                      child: Container(),
                    ),
                    const Spacer(
                      flex: 1,
                    ),

                    Text(state.quantity.toString()),
                    const Spacer(
                      flex: 1,
                    ),

                    ///increase
                    InkWell(
                      radius: 5,
                      borderRadius: BorderRadius.circular(9),
                      onTap: () {
                        productModel.observedQuantity = state.quantity + 1;
                        context
                            .read<QuantityBloc>()
                            .add(IncreaseQuantity(state.quantity));
                      },
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.black.withAlpha(50), width: 1),
                            color: Colors.grey.withAlpha(50),
                          ),
                          child: const Center(
                              child: Text(
                            '+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ))),
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: isInCart
                        ? () => context
                            .read<CartBloc>()
                            .add(CartItemRemoved(productModel))
                        : () => context.read<CartBloc>().add(CartItemAdded(
                            productModel..observedQuantity = state.quantity)),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width * 2 / 3, 30))),
                    child: Text(isInCart ? 'remove' : 'Add To Card'),
                  ),
                ),
              ],
            );
          } else if (state is QuantityMax) {
            ///--------------reach to maximum quantity
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),

                    ///decrease
                    InkWell(
                      radius: 5,
                      borderRadius: BorderRadius.circular(9),
                      onTap: () => context
                          .read<QuantityBloc>()
                          .add(DecreaseQuantity(state.quantity)),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.black.withAlpha(50), width: 1),
                            color: Colors.grey.withAlpha(50),
                          ),
                          child: const Center(
                              child: Text(
                            '-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ))),
                    ),
                    const Spacer(
                      flex: 1,
                    ),

                    Text(state.quantity.toString()),
                    const Spacer(
                      flex: 1,
                    ),

                    ///increase
                    InkWell(
                      radius: 5,
                      borderRadius: BorderRadius.circular(9),
                      child: Container(),
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: isInCart
                        ? () => context
                            .read<CartBloc>()
                            .add(CartItemRemoved(productModel))
                        : () => context.read<CartBloc>().add(CartItemAdded(
                            productModel..observedQuantity = state.quantity)),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width * 2 / 3, 30))),
                    child: Text(isInCart ? 'remove' : 'Add To Card'),
                  ),
                ),
              ],
            );
          } else {
            ///--------------normal quantity Scenario
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),

                    ///decrease
                    InkWell(
                      radius: 5,
                      borderRadius: BorderRadius.circular(9),
                      onTap: () => context
                          .read<QuantityBloc>()
                          .add(DecreaseQuantity(state.quantity)),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.black.withAlpha(50), width: 1),
                            color: Colors.grey.withAlpha(50),
                          ),
                          child: const Center(
                              child: Text(
                            '-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ))),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(state.quantity.toString()),
                    const Spacer(
                      flex: 1,
                    ),

                    ///increase
                    InkWell(
                      radius: 5,
                      borderRadius: BorderRadius.circular(9),
                      onTap: () {
                        productModel.observedQuantity = state.quantity + 1;
                        context
                            .read<QuantityBloc>()
                            .add(IncreaseQuantity(state.quantity));
                      },
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.black.withAlpha(50), width: 1),
                            color: Colors.grey.withAlpha(50),
                          ),
                          child: const Center(
                              child: Text(
                            '+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ))),
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: isInCart
                        ? () => context
                            .read<CartBloc>()
                            .add(CartItemRemoved(productModel))
                        : () => context.read<CartBloc>().add(CartItemAdded(
                            productModel..observedQuantity = state.quantity)),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width * 2 / 3, 30))),
                    child: Text(isInCart ? 'remove' : 'Add To Card'),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class ProductProfile extends StatelessWidget {
  final int index;
  final ProductModel productModel;

  const ProductProfile(
      {Key? key, required this.index, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoading) {
        return const CircularProgressIndicator();
      } else if (state is CartLoaded) {
        ///---------check if item in card
        final bool isInCart = state.cart.items.contains(productModel);

        ///---------product profile design
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.iconColor, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Center(child: Image.asset(productModel.imageUrl.toString())),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productModel.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(productModel.price.toString() + "L.E"),
              ),
              isInCart
                  ? Container()
                  : QuantityDesign(
                      productModel: productModel, isInCart: isInCart),
              if (isInCart)
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () => context
                        .read<CartBloc>()
                        .add(CartItemRemoved(productModel)),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width * 2 / 3, 30))),
                    child: const Text('remove from cart'),
                  ),
                ),
            ],
          ),
        );
      } else {
        ///----------error Card bloc
        return const Text('Error in Card Bloc');
      }
    });
  }
}

class ProductListDesign extends StatelessWidget {
  const ProductListDesign({required this.state, Key? key}) : super(key: key);
  final ProductSuccessState state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
      semanticChildCount: 2,
      itemBuilder: (context, index) {
        ProductModel productModel = state.props[index];
        return InkWell(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.iconColor, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child:  Center(child: Image.asset(productModel.imageUrl.toString())),
                  flex: 3,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Flexible(
                                child: Text(
                              productModel.title.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            )),
                            Text(productModel.price.toString() + "L.E"),
                          ],
                        ),
                      ),
                      Flexible(child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                        if (state is CartLoading) {
                          return const CircularProgressIndicator();
                        }
                        if (state is CartLoaded) {
                          final bool isInCart =
                              state.cart.items.contains(productModel);
                          return IconButton(
                              onPressed: isInCart
                                  ? () => context
                                      .read<CartBloc>()
                                      .add(CartItemRemoved(productModel))
                                  : () => context
                                      .read<CartBloc>()
                                      .add(CartItemAdded(productModel)),
                              icon: Icon(
                                Icons.add_shopping_cart,
                                color: isInCart ? AppColors.primaryColor : null,
                              ));
                        } else {
                          return const Text("Can't Add");
                        }
                      }))
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Scaffold.of(context).showBottomSheet((context) => ProductProfile(
                  index: index,
                  productModel: productModel,
                ));
          },
        );
      },
      itemCount: state.props.length,
    );
  }
}
