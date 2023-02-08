class ProfileResponse {
  ProfileResponse({
    required this.success,
    required this.dataUser,
    required this.dataPic,
  });

  final bool success;
  final DataUser dataUser;
  final DataPic dataPic;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        success: json["success"],
        dataUser: DataUser.fromJson(json["data_user"]),
        dataPic: DataPic.fromJson(json["data_pic"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data_user": dataUser.toJson(),
        "data_pic": dataPic.toJson(),
      };
}

class DataPic {
  DataPic({
    required this.nama,
    required this.phone,
    required this.email,
  });

  final String nama;
  final String phone;
  final String email;

  factory DataPic.fromJson(Map<String, dynamic> json) => DataPic(
        nama: json["nama"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "phone": phone,
        "email": email,
      };
}

class DataUser {
  DataUser({
    required this.nama,
    required this.npwp,
    required this.address,
    required this.selectedPerusahaanId,
  });

  final String nama;
  final String npwp;
  final String address;
  final int selectedPerusahaanId;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        nama: json["nama"],
        npwp: json["npwp"],
        address: json["address"],
        selectedPerusahaanId: json["selected_perusahaan_id"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "npwp": npwp,
        "address": address,
        "selected_perusahaan_id": selectedPerusahaanId,
      };
}
