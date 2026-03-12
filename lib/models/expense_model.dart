enum ExpenseType { travel, food, accommodation, fuel, other }
enum ExpenseStatus { pending, approved, rejected }

class Expense {
  final String id;
  final String employeeId;
  final String employeeName;
  final ExpenseType type;
  final double amount;
  final String description;
  final DateTime expenseDate;
  final ExpenseStatus status;
  final String? billImageUrl;
  final String? approvedBy;
  final DateTime? approvedDate;
  final String? remarks;

  Expense({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.type,
    required this.amount,
    required this.description,
    required this.expenseDate,
    required this.status,
    this.billImageUrl,
    this.approvedBy,
    this.approvedDate,
    this.remarks,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      type: ExpenseType.values.firstWhere((e) => e.toString() == 'ExpenseType.${json['type']}'),
      amount: json['amount'].toDouble(),
      description: json['description'],
      expenseDate: DateTime.parse(json['expenseDate']),
      status: ExpenseStatus.values.firstWhere((e) => e.toString() == 'ExpenseStatus.${json['status']}'),
      billImageUrl: json['billImageUrl'],
      approvedBy: json['approvedBy'],
      approvedDate: json['approvedDate'] != null ? DateTime.parse(json['approvedDate']) : null,
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employeeId': employeeId,
      'employeeName': employeeName,
      'type': type.toString().split('.').last,
      'amount': amount,
      'description': description,
      'expenseDate': expenseDate.toIso8601String(),
      'status': status.toString().split('.').last,
      'billImageUrl': billImageUrl,
      'approvedBy': approvedBy,
      'approvedDate': approvedDate?.toIso8601String(),
      'remarks': remarks,
    };
  }
}
