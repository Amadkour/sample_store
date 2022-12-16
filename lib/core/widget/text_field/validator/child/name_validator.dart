import 'package:queen_validators/queen_validators.dart';
import '../parent/parent_validator.dart';

class NameValidator extends ParentValidator {
  @override
  String? Function(String?)? getValidation() {
    return qValidator(
       [
        IsRequired(
          errorMessage('name_empty'),
        ),
      ],
    );
  }
}
