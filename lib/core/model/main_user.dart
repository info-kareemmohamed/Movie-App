class UserMain {
  String id = "";
  String name = "";
  String email = "";
  String password = "";
  String profilePicture = "";

  static UserMain? instance;

  UserMain._({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.profilePicture,
  });

  static UserMain? setInfoToInstance(Map<String, dynamic> json) {
    if (instance == null) {
      instance = UserMain._(
        id: json['UId'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        profilePicture: json['profilePicture'] as String,
      );
    }
    return instance;
  }

  static UserMain? setDataToInstance(String id, String name, String email,
      String password, String profilePicture) {
    if (instance == null) {
      instance = UserMain._(
          id: id,
          name: name,
          email: email,
          password: password,
          profilePicture: profilePicture);
    }
    return instance;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
    };
  }
}
