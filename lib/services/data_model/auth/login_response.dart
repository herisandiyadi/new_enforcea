// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.apiToken,
    required this.data,
  });

  bool success;
  String apiToken;
  Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        apiToken: json["api_token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "api_token": apiToken,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    this.username,
    required this.email,
    this.emailVerifiedAt,
    required this.address,
    required this.phone,
    this.img,
    required this.isAdmin,
    required this.isClient,
    required this.membership,
    required this.path,
    required this.npwp,
    required this.pic,
    required this.flag,
    required this.verified,
    this.roleId,
    this.idPic,
    required this.apiToken,
    required this.apiTokenIos,
    required this.createdAt,
    required this.updatedAt,
    this.selectedAlamatId,
    required this.selectedPerusahaanId,
  });

  int id;
  String name;
  dynamic username;
  String email;
  dynamic emailVerifiedAt;
  String address;
  String phone;
  dynamic img;
  int isAdmin;
  int isClient;
  int membership;
  String path;
  String npwp;
  int pic;
  String flag;
  String verified;
  dynamic roleId;
  dynamic idPic;
  String apiToken;
  String apiTokenIos;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic selectedAlamatId;
  int selectedPerusahaanId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        address: json["address"],
        phone: json["phone"],
        img: json["img"],
        isAdmin: json["is_admin"],
        isClient: json["is_client"],
        membership: json["membership"],
        path: json["path"],
        npwp: json["npwp"],
        pic: json["pic"],
        flag: json["flag"],
        verified: json["verified"],
        roleId: json["role_id"],
        idPic: json["id_pic"],
        apiToken: json["api_token"],
        apiTokenIos: json["api_token_ios"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        selectedAlamatId: json["selected_alamat_id"],
        selectedPerusahaanId: json["selected_perusahaan_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "address": address,
        "phone": phone,
        "img": img,
        "is_admin": isAdmin,
        "is_client": isClient,
        "membership": membership,
        "path": path,
        "npwp": npwp,
        "pic": pic,
        "flag": flag,
        "verified": verified,
        "role_id": roleId,
        "id_pic": idPic,
        "api_token": apiToken,
        "api_token_ios": apiTokenIos,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "selected_alamat_id": selectedAlamatId,
        "selected_perusahaan_id": selectedPerusahaanId,
      };
}
