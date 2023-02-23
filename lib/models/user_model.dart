class UserModel {
  final int id;
  final String nameEn;
  final String nameAr;
  final String email;
  final String phone;
  final String erpId;
  final double balanceVacation;
  final double casualLeaveBalance;
  final String shortLeaveBalance;

  UserModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.email,
    required this.phone,
    required this.erpId,
    required this.balanceVacation,
    required this.casualLeaveBalance,
    required this.shortLeaveBalance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      nameEn: json['latin_name'],
      nameAr: json['arabic_name'],
      email: json['email'],
      phone: json['phone'] ?? '',
      erpId: json['ERP_ID'],
      balanceVacation: double.parse(json['balance_vacation'].toString()),
      casualLeaveBalance: double.parse(json['casual_leave_balance'].toString()),
      shortLeaveBalance: json['short_leave_balance'],
    );
  }
}
