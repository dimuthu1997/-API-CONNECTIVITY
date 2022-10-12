class User {
  String username = '';
  String email = '';
  String urlAvatar = '';

  User({
    required this.username,
    required this.email,
    required this.urlAvatar,
  });

  ///////Convert json => user object

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    urlAvatar = json['urlAvatar'];
  }
  //////Convert user object  => json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['urlAvatar'] = this.urlAvatar;

    return data;
  }
}
