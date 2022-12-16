import 'package:queen_validators/queen_validators.dart';
import '../parent/parent_validator.dart';

 class PhoneValidator extends ParentValidator {
  @override
  String? Function(String?)? getValidation() {
    return qValidator(
      [
        IsRequired(
          errorMessage('phone_empty'),
        ),
        MinLength(
          9,
          errorMessage('phone_greater'),
        ),
      ],
    );
  }

}
