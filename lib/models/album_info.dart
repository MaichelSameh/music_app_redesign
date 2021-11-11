class AlbumInfo {
  late String _name;
  late String _imageURL;
  late String _description;
  late int _id;

  String get name => _name;
  String get imageURL => _imageURL;
  String get description => _description;
  int get id => _id;

  AlbumInfo({
    required String name,
    required String imageURL,
    required String description,
    required int id,
  }) {
    _description = description;
    _id = id;
    _imageURL = imageURL;
    _name = name;
  }

  AlbumInfo.empty() {
    _description = "description";
    _id = 0;
    _imageURL = "imageURL";
    _name = "name";
  }

  AlbumInfo.fromJSON(Map<String, dynamic> json) {
    _description = json["description"];
    _id = json["id"];
    _imageURL = json["image_url"];
    _name = json["name"];
  }

  @override
  String toString() {
    return '''
      description: $description,
      id: $id,
      image_url: $imageURL,
      name: $name,
    ''';
  }

  void copyWith({
    String? name,
    String? imageURL,
    String? description,
    int? id,
  }) {
    _description = description ?? _description;
    _id = id ?? _id;
    _imageURL = imageURL ?? _imageURL;
    _name = name ?? _name;
  }
}
