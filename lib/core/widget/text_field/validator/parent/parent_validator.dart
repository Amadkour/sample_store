import '../../../../global_bloc/app_bloc.dart';

abstract class ParentValidator {
  String? Function(String?)? getValidation(){return null;}
  String? Function(String?)? getValidationWithParameter(String key){return null;}

  String? errorMessage(String key) {
    if (key == 'accept') {
      return null;
    } else {
      return tr(key);
    }
  }
}
