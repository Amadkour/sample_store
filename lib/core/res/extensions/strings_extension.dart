String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

extension CustomString on Object? {
  int? parseToInt() {
    return int.tryParse(this?.toString().replaceAll(',', '') ?? '');
  }

  double? parseToDouble() {
    return double.tryParse(this?.toString().replaceAll(',', '') ?? '');
  }
}
