// To parse this JSON data, do

class ResetPasswordResponse {
  ResetPasswordResponse({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
