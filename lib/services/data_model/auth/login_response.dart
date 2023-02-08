// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

// import 'dart:convert';

// LoginResponse loginResponseFromJson(String str) =>
//     LoginResponse.fromJson(json.decode(str));

// String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.statusCode,
    required this.message,
    required this.token,
    required this.result,
  });

  String statusCode;
  String message;
  String token;
  Result result;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json["statusCode"],
        message: json["message"],
        token: json["token"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "token": token,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.data,
  });

  Data data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.login,
  });

  Login login;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        login: Login.fromJson(json["login"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login.toJson(),
      };
}

class Login {
  Login({
    required this.token,
    required this.user,
  });

  String token;
  UserModel user;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class UserModel {
  UserModel({
    required this.id,
    required this.firstLogin,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.phoneNumber,
    required this.userdetails,
    required this.accounts,
  });

  String id;
  bool firstLogin;
  String firstName;
  String lastName;
  String email;
  String role;
  String phoneNumber;
  List<Userdetail> userdetails;
  List<Account> accounts;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstLogin: json["firstLogin"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        role: json["role"],
        phoneNumber: json["phoneNumber"],
        userdetails: List<Userdetail>.from(
            json["userdetails"].map((x) => Userdetail.fromJson(x))),
        accounts: List<Account>.from(
            json["accounts"].map((x) => Account.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstLogin": firstLogin,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "role": role,
        "phoneNumber": phoneNumber,
        "userdetails": List<dynamic>.from(userdetails.map((x) => x.toJson())),
        "accounts": List<dynamic>.from(accounts.map((x) => x.toJson())),
      };
}

class Account {
  Account({
    required this.id,
    required this.tipepay,
    required this.tipeacct,
    this.parent,
    required this.statusreg,
    this.desc,
    required this.companys,
  });

  String id;
  String tipepay;
  String tipeacct;
  dynamic parent;
  String statusreg;
  dynamic desc;
  List<Company> companys;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        tipepay: json["tipepay"],
        tipeacct: json["tipeacct"],
        parent: json["parent"],
        statusreg: json["statusreg"],
        desc: json["desc"],
        companys: List<Company>.from(
            json["companys"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipepay": tipepay,
        "tipeacct": tipeacct,
        "parent": parent,
        "statusreg": statusreg,
        "desc": desc,
        "companys": List<dynamic>.from(companys.map((x) => x.toJson())),
      };
}

class Company {
  Company({
    required this.nama,
  });

  String nama;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
      };
}

class Userdetail {
  Userdetail({
    required this.locations,
    required this.locationother,
  });

  List<Location> locations;
  List<Location> locationother;

  factory Userdetail.fromJson(Map<String, dynamic> json) => Userdetail(
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
        locationother: List<Location>.from(
            json["locationother"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "locationother":
            List<dynamic>.from(locationother.map((x) => x.toJson())),
      };
}

class Location {
  Location({
    required this.id,
    required this.loccode,
    required this.tpay,
    required this.custId,
    required this.loctype,
  });

  String id;
  String loccode;
  String tpay;
  int custId;
  Loctype loctype;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        loccode: json["loccode"],
        tpay: json["tpay"],
        custId: json["custID"],
        loctype: Loctype.fromJson(json["loctype"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "loccode": loccode,
        "tpay": tpay,
        "custID": custId,
        "loctype": loctype.toJson(),
      };
}

class Loctype {
  Loctype({
    required this.description,
  });

  String description;

  factory Loctype.fromJson(Map<String, dynamic> json) => Loctype(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}
