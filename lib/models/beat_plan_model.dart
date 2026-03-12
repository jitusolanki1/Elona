class BeatPlan {
  final String id;
  final String name;
  final String employeeId;
  final String employeeName;
  final String territory;
  final List<String> customerIds;
  final String dayOfWeek; // Monday, Tuesday, etc.
  final DateTime effectiveFrom;
  final bool isActive;

  BeatPlan({
    required this.id,
    required this.name,
    required this.employeeId,
    required this.employeeName,
    required this.territory,
    required this.customerIds,
    required this.dayOfWeek,
    required this.effectiveFrom,
    this.isActive = true,
  });

  factory BeatPlan.fromJson(Map<String, dynamic> json) {
    return BeatPlan(
      id: json['id'],
      name: json['name'],
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      territory: json['territory'],
      customerIds: List<String>.from(json['customerIds']),
      dayOfWeek: json['dayOfWeek'],
      effectiveFrom: DateTime.parse(json['effectiveFrom']),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'employeeId': employeeId,
      'employeeName': employeeName,
      'territory': territory,
      'customerIds': customerIds,
      'dayOfWeek': dayOfWeek,
      'effectiveFrom': effectiveFrom.toIso8601String(),
      'isActive': isActive,
    };
  }
}

enum VisitStatus { planned, inProgress, completed, cancelled }

class CustomerVisit {
  final String id;
  final String customerId;
  final String customerName;
  final String employeeId;
  final String employeeName;
  final DateTime visitDate;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  final double? checkInLatitude;
  final double? checkInLongitude;
  final String? purpose;
  final String? feedback;
  final VisitStatus status;
  final List<String>? photoUrls;

  CustomerVisit({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.employeeId,
    required this.employeeName,
    required this.visitDate,
    this.checkInTime,
    this.checkOutTime,
    this.checkInLatitude,
    this.checkInLongitude,
    this.purpose,
    this.feedback,
    required this.status,
    this.photoUrls,
  });

  factory CustomerVisit.fromJson(Map<String, dynamic> json) {
    return CustomerVisit(
      id: json['id'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      visitDate: DateTime.parse(json['visitDate']),
      checkInTime: json['checkInTime'] != null ? DateTime.parse(json['checkInTime']) : null,
      checkOutTime: json['checkOutTime'] != null ? DateTime.parse(json['checkOutTime']) : null,
      checkInLatitude: json['checkInLatitude']?.toDouble(),
      checkInLongitude: json['checkInLongitude']?.toDouble(),
      purpose: json['purpose'],
      feedback: json['feedback'],
      status: VisitStatus.values.firstWhere((e) => e.toString() == 'VisitStatus.${json['status']}'),
      photoUrls: json['photoUrls'] != null ? List<String>.from(json['photoUrls']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'customerName': customerName,
      'employeeId': employeeId,
      'employeeName': employeeName,
      'visitDate': visitDate.toIso8601String(),
      'checkInTime': checkInTime?.toIso8601String(),
      'checkOutTime': checkOutTime?.toIso8601String(),
      'checkInLatitude': checkInLatitude,
      'checkInLongitude': checkInLongitude,
      'purpose': purpose,
      'feedback': feedback,
      'status': status.toString().split('.').last,
      'photoUrls': photoUrls,
    };
  }
}
