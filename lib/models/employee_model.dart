class Employee {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String designation;
  final String department;
  final String managerId;
  final String? managerName;
  final String territory;
  final DateTime joinDate;
  final String? avatar;
  final bool isActive;
  final String employeeCode;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.designation,
    required this.department,
    required this.managerId,
    this.managerName,
    required this.territory,
    required this.joinDate,
    this.avatar,
    this.isActive = true,
    required this.employeeCode,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      designation: json['designation'],
      department: json['department'],
      managerId: json['managerId'],
      managerName: json['managerName'],
      territory: json['territory'],
      joinDate: DateTime.parse(json['joinDate']),
      avatar: json['avatar'],
      isActive: json['isActive'] ?? true,
      employeeCode: json['employeeCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'designation': designation,
      'department': department,
      'managerId': managerId,
      'managerName': managerName,
      'territory': territory,
      'joinDate': joinDate.toIso8601String(),
      'avatar': avatar,
      'isActive': isActive,
      'employeeCode': employeeCode,
    };
  }
}
