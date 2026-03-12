class Customer {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String pincode;
  final String? gstin;
  final String customerType; // Retailer, Wholesaler, Distributor
  final double creditLimit;
  final double outstandingBalance;
  final double latitude;
  final double longitude;
  final String assignedTo; // Employee ID
  final DateTime createdAt;
  final bool isActive;
  final String? beat;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    this.gstin,
    required this.customerType,
    required this.creditLimit,
    required this.outstandingBalance,
    required this.latitude,
    required this.longitude,
    required this.assignedTo,
    required this.createdAt,
    this.isActive = true,
    this.beat,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      gstin: json['gstin'],
      customerType: json['customerType'],
      creditLimit: json['creditLimit'].toDouble(),
      outstandingBalance: json['outstandingBalance'].toDouble(),
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      assignedTo: json['assignedTo'],
      createdAt: DateTime.parse(json['createdAt']),
      isActive: json['isActive'] ?? true,
      beat: json['beat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'gstin': gstin,
      'customerType': customerType,
      'creditLimit': creditLimit,
      'outstandingBalance': outstandingBalance,
      'latitude': latitude,
      'longitude': longitude,
      'assignedTo': assignedTo,
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
      'beat': beat,
    };
  }
}
