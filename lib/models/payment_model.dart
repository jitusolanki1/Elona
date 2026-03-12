enum PaymentMode { cash, cheque, upi, neft, card }
enum PaymentStatus { pending, completed, failed }

class Payment {
  final String id;
  final String customerId;
  final String customerName;
  final String salesRepId;
  final String salesRepName;
  final double amount;
  final PaymentMode mode;
  final PaymentStatus status;
  final DateTime paymentDate;
  final String? transactionId;
  final String? chequeNumber;
  final DateTime? chequeDate;
  final String? bankName;
  final String? notes;
  final String? orderId;

  Payment({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.salesRepId,
    required this.salesRepName,
    required this.amount,
    required this.mode,
    required this.status,
    required this.paymentDate,
    this.transactionId,
    this.chequeNumber,
    this.chequeDate,
    this.bankName,
    this.notes,
    this.orderId,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      salesRepId: json['salesRepId'],
      salesRepName: json['salesRepName'],
      amount: json['amount'].toDouble(),
      mode: PaymentMode.values.firstWhere((e) => e.toString() == 'PaymentMode.${json['mode']}'),
      status: PaymentStatus.values.firstWhere((e) => e.toString() == 'PaymentStatus.${json['status']}'),
      paymentDate: DateTime.parse(json['paymentDate']),
      transactionId: json['transactionId'],
      chequeNumber: json['chequeNumber'],
      chequeDate: json['chequeDate'] != null ? DateTime.parse(json['chequeDate']) : null,
      bankName: json['bankName'],
      notes: json['notes'],
      orderId: json['orderId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'customerName': customerName,
      'salesRepId': salesRepId,
      'salesRepName': salesRepName,
      'amount': amount,
      'mode': mode.toString().split('.').last,
      'status': status.toString().split('.').last,
      'paymentDate': paymentDate.toIso8601String(),
      'transactionId': transactionId,
      'chequeNumber': chequeNumber,
      'chequeDate': chequeDate?.toIso8601String(),
      'bankName': bankName,
      'notes': notes,
      'orderId': orderId,
    };
  }
}
