class OrderItem {
  final String productId;
  final String productName;
  final int quantity;
  final double price;
  final double discount;
  final double gst;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.discount = 0,
    required this.gst,
  });

  double get subtotal => quantity * price;
  double get discountAmount => subtotal * (discount / 100);
  double get taxableAmount => subtotal - discountAmount;
  double get gstAmount => taxableAmount * (gst / 100);
  double get total => taxableAmount + gstAmount;

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      discount: json['discount']?.toDouble() ?? 0,
      gst: json['gst'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'discount': discount,
      'gst': gst,
    };
  }
}

enum OrderStatus { pending, confirmed, processing, dispatched, delivered, cancelled }

class Order {
  final String id;
  final String customerId;
  final String customerName;
  final String salesRepId;
  final String salesRepName;
  final DateTime orderDate;
  final List<OrderItem> items;
  final double subtotal;
  final double discount;
  final double gstAmount;
  final double totalAmount;
  final OrderStatus status;
  final String? notes;
  final DateTime? deliveryDate;
  final String? invoiceNumber;

  Order({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.salesRepId,
    required this.salesRepName,
    required this.orderDate,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.gstAmount,
    required this.totalAmount,
    required this.status,
    this.notes,
    this.deliveryDate,
    this.invoiceNumber,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      salesRepId: json['salesRepId'],
      salesRepName: json['salesRepName'],
      orderDate: DateTime.parse(json['orderDate']),
      items: (json['items'] as List).map((item) => OrderItem.fromJson(item)).toList(),
      subtotal: json['subtotal'].toDouble(),
      discount: json['discount'].toDouble(),
      gstAmount: json['gstAmount'].toDouble(),
      totalAmount: json['totalAmount'].toDouble(),
      status: OrderStatus.values.firstWhere((e) => e.toString() == 'OrderStatus.${json['status']}'),
      notes: json['notes'],
      deliveryDate: json['deliveryDate'] != null ? DateTime.parse(json['deliveryDate']) : null,
      invoiceNumber: json['invoiceNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'customerName': customerName,
      'salesRepId': salesRepId,
      'salesRepName': salesRepName,
      'orderDate': orderDate.toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
      'subtotal': subtotal,
      'discount': discount,
      'gstAmount': gstAmount,
      'totalAmount': totalAmount,
      'status': status.toString().split('.').last,
      'notes': notes,
      'deliveryDate': deliveryDate?.toIso8601String(),
      'invoiceNumber': invoiceNumber,
    };
  }
}
