import 'package:queen_validators/queen_validators.dart';
import '../parent/parent_validator.dart';

 class PhoneValidator extends ParentValidator {
  @override
  String? Function(String?)? getValidation() {
    return qValidator(
      [
        StartsWith('05'),
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
