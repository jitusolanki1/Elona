enum UserRole { admin, salesManager, salesRep, distributor }

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final UserRole role;
  final String? avatar;
  final String? designation;
  final String? territory;
  final DateTime joinDate;
  final bool isActive;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.avatar,
    this.designation,
    this.territory,
    required this.joinDate,
    this.isActive = true,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: UserRole.values.firstWhere((e) => e.toString() == 'UserRole.${json['role']}'),
      avatar: json['avatar'],
      designation: json['designation'],
      territory: json['territory'],
      joinDate: DateTime.parse(json['joinDate']),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role.toString().split('.').last,
      'avatar': avatar,
      'designation': designation,
      'territory': territory,
      'joinDate': joinDate.toIso8601String(),
      'isActive': isActive,
    };
  }
}
