class UserMain {
  String id = "";
  String name = "";
  String email = "";
  String? profilePicture;

  static UserMain? instance;

  UserMain._({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  static UserMain? setInfoToInstance(Map<String, dynamic> json) {
    if (json != null) {
      instance ??= UserMain._(
        id: json['UId'] as String ?? '',
        name: json['name'] as String ?? '',
        email: json['email'] as String ?? '',
        profilePicture: json['profilePicture'] as String ?? '',
      );
    }
    return instance;
  }

  static UserMain? setDataToInstance(String id, String name, String email,
      String password, String profilePicture) {
    instance ??= UserMain._(
        id: id, name: name, email: email, profilePicture: profilePicture);
    return instance;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePicture': profilePicture,
    };
  }
}
