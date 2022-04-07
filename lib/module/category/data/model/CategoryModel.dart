/// id : 2
/// title : "praesentium necessitatibus sint"

class CategoryModel {
  CategoryModel({
      int? id, 
      String? title,}){
    _id = id;
    _title = title;
}

  CategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }
  int? _id;
  String? _title;
CategoryModel copyWith({  int? id,
  String? title,
}) => CategoryModel(  id: id ?? _id,
  title: title ?? _title,
);
  int? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}