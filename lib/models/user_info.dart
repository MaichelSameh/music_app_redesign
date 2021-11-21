class UserInfo {
  late String _name;
  late String _imageURL;
  late String _userName;
  late String _appleId;
  late String _facebook;
  late int _planID;
  late int _id;

  String get name => _name;
  String get imageUrl => _imageURL;
  String get userName => _userName;
  String get appleId => _appleId;
  String get facebook => _facebook;
  int get planId => _planID;
  int get id => _id;

  UserInfo({
    required String name,
    required String imageURL,
    required String userName,
    required String appleId,
    required String facebook,
    required int planID,
    required int id,
  }) {
    _name = name;
    _imageURL = imageURL;
    _userName = userName;
    _appleId = appleId;
    _facebook = facebook;
    _planID = planID;
    _id = id;
  }

  UserInfo.empty() {
    _name = "Emma Mason";
    _imageURL =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9ac-elmnnSJYqgZNvT3WErhi5jU59ebCRzg&usqp=CAU";
    _userName = "@" + name.replaceAll(" ", "");
    _appleId = "appleId";
    _facebook = "facebook";
    _planID = 0;
    _id = 0;
  }

  UserInfo.fromJSON(Map<String, dynamic> json) {
    _name = json["name"];
    _imageURL = json["image"];
    _userName = json["username"];
    _appleId = json["apple_id"];
    _facebook = json["facebook"];
    _planID = json["plan_id"];
    _id = json["id"];
  }

  @override
  String toString() {
    return '''
      name: $name,
      image_url: $imageUrl,
      user_name: $userName,
      apple_id: $appleId,
      facebook: $facebook,
      plan_id: $planId,
      id: $id,
    ''';
  }

  void copyWith({
    String? name,
    String? imageURL,
    String? userName,
    String? appleId,
    String? facebook,
    int? planID,
    int? id,
  }) {
    _appleId = appleId ?? _appleId;
    _facebook = facebook ?? _facebook;
    _id = id ?? _id;
    _imageURL = imageURL ?? _imageURL;
    _name = name ?? _name;
    _planID = planID ?? _planID;
    _userName = userName ?? _userName;
  }
}
