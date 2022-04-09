import 'package:bloc/bloc.dart';
import 'package:sample_store/module/product/bloc/product_event.dart';
import 'package:sample_store/module/product/bloc/product_state.dart';
import '../data/model/ProductModel.dart';
import '../data/repository/productApi.dart';
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository? productRepository;

  ProductBloc({required this.productRepository}) : super(ProductLoadingState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProducts) {
      yield ProductLoadingState();
      try {
        List< ProductModel> productModel;

        ///------------get data from category's products if pass category Id
        if(event.categoryId!=null){
          productModel = await productRepository!.getProductCategory(event.categoryId);
        }else{
          ///------------get data from products if not pass category Id
          productModel = await productRepository!.getProductData();
        }
        yield ProductSuccessState( productModels: productModel);
      } catch (e) {
        yield ProductFailState(message: e.toString());
      }
    }
  }
}