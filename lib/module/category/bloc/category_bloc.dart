import 'package:bloc/bloc.dart';
import '../data/model/CategoryModel.dart';
import '../data/repository/category_Api.dart';
import 'category_event.dart';
import 'category_state.dart';
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository? categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryLoadingState());
  ///---------------listen events and convert it to states
  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategories) {
      yield CategoryLoadingState();
      try {
        ///------------fetch categories from API
       List<CategoryModel> categoryModel =(await categoryRepository!.getCategory())..insert(0, CategoryModel(null,'All Categories'));
        yield CategorySuccessState( categoryModels:categoryModel);
      } catch (e) {
        yield CategoryFailState(message: e.toString());
      }
    }
  }
}