class NewsModel {
  NewsModel({
    DateTime? createdAt,
    String? titleAr,
    String? titleEn,
    String? contentAr,
    String? contentEn,
    String? image,
    String? id,
  }) {
    _createdAt = createdAt;
    _titleAr = titleAr;
    _titleEn = titleEn;
    _contentAr = contentAr;
    _contentEn = contentEn;
    _image = image;
    _id = id;
  }

  NewsModel.fromJson(dynamic json) {
    _createdAt = DateTime.parse(json['createdAt']);
    _titleAr = json['title_ar'];
    _titleEn = json['title_en'];
    _contentAr = json['content_ar'];
    _contentEn = json['content_en'];
    _image = json['image'];
    _id = json['id'];
  }

  DateTime? _createdAt;
  String? _titleAr;
  String? _titleEn;
  String? _contentAr;
  String? _contentEn;
  String? _image;
  String? _id;

  NewsModel copyWith({
    DateTime? createdAt,
    String? titleAr,
    String? titleEn,
    String? contentAr,
    String? contentEn,
    String? image,
    String? id,
  }) =>
      NewsModel(
        createdAt: createdAt ?? _createdAt,
        titleAr: titleAr ?? _titleAr,
        titleEn: titleEn ?? _titleEn,
        contentAr: contentAr ?? _contentAr,
        contentEn: contentEn ?? _contentEn,
        image: image ?? _image,
        id: id ?? _id,
      );

  DateTime? get createdAt => _createdAt;

  String? get titleAr => _titleAr;

  String? get titleEn => _titleEn;

  String? get contentAr => _contentAr;

  String? get contentEn => _contentEn;

  String? get image => _image;

  String? get id => _id;
}
