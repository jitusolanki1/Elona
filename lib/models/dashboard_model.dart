class DashboardStats {
  final double todaysSales;
  final int todaysOrders;
  final int todaysVisits;
  final double monthlyRevenue;
  final double targetAchievement;
  final int pendingOrders;
  final int pendingPayments;
  final int activeCustomers;

  DashboardStats({
    required this.todaysSales,
    required this.todaysOrders,
    required this.todaysVisits,
    required this.monthlyRevenue,
    required this.targetAchievement,
    required this.pendingOrders,
    required this.pendingPayments,
    required this.activeCustomers,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      todaysSales: json['todaysSales'].toDouble(),
      todaysOrders: json['todaysOrders'],
      todaysVisits: json['todaysVisits'],
      monthlyRevenue: json['monthlyRevenue'].toDouble(),
      targetAchievement: json['targetAchievement'].toDouble(),
      pendingOrders: json['pendingOrders'],
      pendingPayments: json['pendingPayments'],
      activeCustomers: json['activeCustomers'],
    );
  }
}

class SalesData {
  final String label;
  final double value;

  SalesData(this.label, this.value);
}

class Inventory {
  final String id;
  final String productId;
  final String productName;
  final int quantity;
  final String warehouseId;
  final String warehouseName;
  final DateTime lastUpdated;

  Inventory({
    required this.id,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.warehouseId,
    required this.warehouseName,
    required this.lastUpdated,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      id: json['id'],
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      warehouseId: json['warehouseId'],
      warehouseName: json['warehouseName'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'warehouseId': warehouseId,
      'warehouseName': warehouseName,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }
}
