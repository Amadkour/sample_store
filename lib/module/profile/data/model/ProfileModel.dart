/// id : 2
/// name : "client"
/// email : "client@localhost"

class ProfileModel {
  ProfileModel({
      int? id, 
      String? name, 
      String? email,}){
    _id = id;
    _name = name;
    _email = email;
}

  ProfileModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
  }
  int? _id;
  String? _name;
  String? _email;
ProfileModel copyWith({  int? id,
  String? name,
  String? email,
}) => ProfileModel(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
);
  int? get id => _id;
  String? get name => _name;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    return map;
  }

}