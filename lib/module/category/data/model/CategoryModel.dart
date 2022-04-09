class CategoryModel {

  CategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
  }

  int? _id;
  String? _title;

  int? get id => _id;

  String? get title => _title;

  CategoryModel(this._id, this._title);
}
