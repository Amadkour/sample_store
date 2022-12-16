import 'package:queen_validators/queen_validators.dart';
import '../parent/parent_validator.dart';

class EmptyValidator extends ParentValidator {
  @override
  String? Function(String?)? getValidationWithParameter(String key)  {
    return qValidator(
      [
        IsRequired(
          errorMessage(key),
        ),
      ],
    );
  }

}