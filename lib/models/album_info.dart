class AlbumInfo {
  late String _name;
  late String _imageURL;
  late String _description;
  late int _id;
  late DateTime _date;
  late int _songsNumber;

  String get name => _name;
  String get imageURL => _imageURL;
  String get description => _description;
  int get id => _id;
  int get songsNumber => _songsNumber;
  DateTime get date => _date;

  AlbumInfo({
    required String name,
    required String imageURL,
    required String description,
    required int id,
    required DateTime date,
    required int songsNumber,
  }) {
    _description = description;
    _id = id;
    _imageURL = imageURL;
    _name = name;
    _date = date;
    _songsNumber = songsNumber;
  }

  AlbumInfo.empty() {
    _description = "description";
    _id = 0;
    _imageURL = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9QgsItwYwzeESajmJM1r2XKMIa8PykgHKlg&usqp=CAU";
    _name = "name";
    _date = DateTime.now();
    _songsNumber = 12;
  }

  AlbumInfo.fromJSON(Map<String, dynamic> json) {
    _description = json["description"];
    _id = json["id"];
    _imageURL = json["image_url"];
    _name = json["name"];
    _date = json["date"];
    _songsNumber = json["songs_number"];
  }

  @override
  String toString() {
    return '''
      description: $description,
      id: $id,
      image_url: $imageURL,
      name: $name,
      date: $date,
      song_number: $songsNumber
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
