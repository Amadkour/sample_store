import 'package:queen_validators/queen_validators.dart';
import '../parent/parent_validator.dart';

 class PhoneValidator extends ParentValidator {
  @override
  String? Function(String?)? getValidation() {
    return qValidator(
      [
        StartsWith(r'05', errorMessage('phone_greater'),),
        IsRequired(
          errorMessage('phone_empty'),
        ),
        MinLength(
          10,
          errorMessage('phone_greater'),
        ),
        MaxLength(
          10,
          errorMessage('phone_greater'),
        ),
      ],
    );
  }

}
