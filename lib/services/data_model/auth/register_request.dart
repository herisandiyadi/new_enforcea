class RegisterRequest {
  String? _namaPerusahan;
  String? _npwp;
  String? _email;
  String? _phone;
  String? _alamat;
  String? _password;
  String? _passwordConfirm;
  String? _pic;

  String? get namaPerusahan => _namaPerusahan;
  String? get npwp => _npwp;
  String? get email => _email;
  String? get phone => _phone;
  String? get alamat => _alamat;
  String? get password => _password;
  String? get passwordConfirm => _passwordConfirm;
  String? get pic => _pic;

  RegisterRequest(
      {required String namaPerusahan,
      required String npwp,
      required String email,
      required String phone,
      required String alamat,
      required String password,
      required String passwordConfirm,
      String pic = ''}) {
    _namaPerusahan = namaPerusahan;
    _npwp = npwp;
    _email = email;
    _phone = phone;
    _alamat = alamat;
    _password = password;
    _passwordConfirm = passwordConfirm;
    _pic = pic;
  }

  RegisterRequest.fromJson(dynamic json) {
    _namaPerusahan = json["namaPerusahan"];
    _npwp = json["npwp"];
    _email = json["email"];
    _phone = json["phone"];
    _alamat = json["alamat"];
    _password = json["password"];
    _passwordConfirm = json["passwordConfirm"];
    _pic = json["pic"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["nama_perusahan"] = _namaPerusahan;
    map["npwp"] = _npwp;
    map["email"] = _email;
    map["phone"] = _phone;
    map["alamat"] = _alamat;
    map["password"] = _password;
    map["password_confirm"] = _passwordConfirm;
    map["pic"] = _pic;
    return map;
  }
}
