class User {
  String? _name;
  String? _password;

  User({String? name, String? password}) {
    if (name != null) {
      this._name = name;
    }
    if (password != null) {
      this._password = password;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get password => _password;
  set password(String? password) => _password = password;

  User.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['password'] = this._password;
    return data;
  }
}

