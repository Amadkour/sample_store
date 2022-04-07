import 'package:bloc/bloc.dart';
import '../data/model/CategoryModel.dart';
import '../data/repository/category_Api.dart';
import 'category_event.dart';
import 'category_state.dart';
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository? categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryLoadingState());

  // CategoryState get initialState => CategoryLoadingState();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategories) {
      yield CategoryLoadingState();
      try {
       List<CategoryModel> categoryModel = await categoryRepository!.getCategory();
        yield CategorySuccessState( categoryModels:categoryModel);
      } catch (e) {
        yield CategoryFailState(message: e.toString());
      }
    }
  }
}