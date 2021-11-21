class ArtistInfo {
  late String _name;
  late String _about;
  late String _imageURL;
  late int _id;

  String get name => _name;
  String get about => _about;
  String get imageURL => _imageURL;
  int get id => _id;

  ArtistInfo({
    required String name,
    required String about,
    required String imageURL,
    required int id,
  }) {
    _about = about;
    _id = id;
    _imageURL = imageURL;
    _name = name;
  }

  ArtistInfo.empty() {
    _about = "about";
    _id = 0;
    _imageURL =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOVj4H7KD4m5lgmsfdCLP3iJMM71wEfyT7QQ&usqp=CAU";
    _name = "name";
  }

  ArtistInfo.fromJSON(Map<String, dynamic> json) {
    _about = json["about"];
    _id = json["id"];
    _imageURL = json["imageURL"];
    _name = json["name"];
  }

  @override
  String toString() {
    return '''
      about: $about,
      id: $id,
      image_url: $imageURL,
      name: $name,
    ''';
  }

  void copyWith({
    String? name,
    String? about,
    String? imageURL,
    int? id,
  }) {
    _name = name ?? _name;
    _about = about ?? _about;
    _imageURL = imageURL ?? _imageURL;
    _id = id ?? _id;
  }
}
