import 'package:queen_validators/queen_validators.dart';
import '../parent/parent_validator.dart';

class EmailValidator extends ParentValidator {
  @override
  String? Function(String?)? getValidation() {
    return qValidator(
      [
        IsRequired(
          errorMessage('email_empty'),
        ),
        IsEmail(errorMessage('email_greater'))
      ],
    );
  }
}
