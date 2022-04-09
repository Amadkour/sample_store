class ProfileModel {
  ProfileModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
  }

  int? _id;
  String? _name;
  String? _email;

  int? get id => _id;

  String? get name => _name;

  String? get email => _email;
}
