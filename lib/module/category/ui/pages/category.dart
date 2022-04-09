import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_store/core/thems/colors.dart';
import 'package:sample_store/module/dashbord/bloc/tab_index_bloc.dart';
import 'package:sample_store/module/product/bloc/product_bloc.dart';
import '../../../product/bloc/product_event.dart';
import '../../bloc/category_bloc.dart';
import '../../bloc/category_state.dart';
import '../../data/model/CategoryModel.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryFailState) {
        return  Text(state.message);
      } else if (state is CategoryLoadingState) {
        ///-------------loading
        return loading();
      } else if (state is CategorySuccessState) {
        ///--------------loading product Successfully
        return CategoryListDesign(state:state);
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    }));
  }


  Widget loading() => Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ));
}
class CategoryListDesign extends StatelessWidget {
  final CategorySuccessState state;
  const CategoryListDesign({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
      semanticChildCount: 2,
      itemBuilder: (context, index) {
        CategoryModel categoryModel = state.props[index];
        ///-----------move to product tab, then fetch all category's products
        return InkWell(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColors.listColors[index % 5],
                border: Border.all(color: AppColors.iconColor, width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    categoryModel.title.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            TabIndexBloc.control.index=0;
            BlocProvider.of<ProductBloc>(context).add(FetchProducts(categoryId: categoryModel.id));
          },
        );
      },
      itemCount: state.props.length,
    );
  }
}
