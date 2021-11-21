class SongInfo {
  late String _name;
  late String _imageURL;
  late int _albumID;
  late int _durationInMilleSeconds;
  late int _id;
  late int _listenBy;
  late bool _liked;

  String get name => _name;
  String get imageURL => _imageURL;
  int get albumID => _albumID;
  int get durationInMilleSeconds => _durationInMilleSeconds;
  int get id => _id;
  int get listenByCount => _listenBy;
  bool get liked => _liked;

  SongInfo({
    required String name,
    required String imageURL,
    required int albumID,
    required int durationInMilleSeconds,
    required int id,
    required int listenBy,
    required bool liked,
  }) {
    _albumID = albumID;
    _durationInMilleSeconds = durationInMilleSeconds;
    _id = id;
    _imageURL = imageURL;
    _listenBy = listenBy;
    _name = name;
    _liked = liked;
  }

  SongInfo.empty() {
    _albumID = 0;
    _durationInMilleSeconds = 4000;
    _id = 0;
    _imageURL =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCZCQ8Geml_ErHofuVcl7oYAxYwyA1U0CxAA&usqp=CAU";
    _listenBy = 0;
    _name = "name";
    _liked = false;
  }

  SongInfo.fromJSON(Map<String, dynamic> json) {
    _albumID = json["album_id"] ?? 0;
    _durationInMilleSeconds = json["duration"] ?? 0;
    _id = json["id"] ?? 0;
    _imageURL = json["image"] ?? "";
    _listenBy = json["listen_count"] ?? 0;
    _name = json["name"] ?? "";
    _liked = json["loved"] ?? false;
  }

  @override
  String toString() {
    return '''
      album-id: $albumID,
      duration_in-mille_seconds: $durationInMilleSeconds,
      id: $id,
      image_url: $imageURL,
      listen_by_count: $listenByCount,
      name: $name,
      liked: $liked
    ''';
  }

  void copyWith({
    String? name,
    String? imageURL,
    int? albumID,
    int? durationInMilleSeconds,
    int? id,
    int? listenBy,
    bool? liked,
  }) {
    _albumID = albumID ?? _albumID;
    _durationInMilleSeconds = durationInMilleSeconds ?? _durationInMilleSeconds;
    _id = id ?? _id;
    _imageURL = imageURL ?? _imageURL;
    _listenBy = listenBy ?? _listenBy;
    _name = name ?? _name;
    _liked = liked ?? _liked;
  }
}
