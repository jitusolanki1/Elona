class Target {
  final String id;
  final String employeeId;
  final String employeeName;
  final double salesTarget;
  final double salesAchieved;
  final int orderTarget;
  final int orderAchieved;
  final int visitTarget;
  final int visitAchieved;
  final String period; // Monthly, Quarterly, Yearly
  final DateTime startDate;
  final DateTime endDate;

  Target({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.salesTarget,
    required this.salesAchieved,
    required this.orderTarget,
    required this.orderAchieved,
    required this.visitTarget,
    required this.visitAchieved,
    required this.period,
    required this.startDate,
    required this.endDate,
  });

  double get salesAchievementPercentage =>
    salesTarget > 0 ? (salesAchieved / salesTarget) * 100 : 0;

  double get orderAchievementPercentage =>
    orderTarget > 0 ? (orderAchieved / orderTarget) * 100 : 0;

  double get visitAchievementPercentage =>
    visitTarget > 0 ? (visitAchieved / visitTarget) * 100 : 0;

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      id: json['id'],
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      salesTarget: json['salesTarget'].toDouble(),
      salesAchieved: json['salesAchieved'].toDouble(),
      orderTarget: json['orderTarget'],
      orderAchieved: json['orderAchieved'],
      visitTarget: json['visitTarget'],
      visitAchieved: json['visitAchieved'],
      period: json['period'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employeeId': employeeId,
      'employeeName': employeeName,
      'salesTarget': salesTarget,
      'salesAchieved': salesAchieved,
      'orderTarget': orderTarget,
      'orderAchieved': orderAchieved,
      'visitTarget': visitTarget,
      'visitAchieved': visitAchieved,
      'period': period,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
