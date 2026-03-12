import 'package:flutter/material.dart';
import '../models/payment_model.dart';
import '../services/mock_data_service.dart';

class PaymentProvider with ChangeNotifier {
  List<Payment> _payments = [];
  Payment? _selectedPayment;
  bool _isLoading = false;

  List<Payment> get payments => _payments;
  Payment? get selectedPayment => _selectedPayment;
  bool get isLoading => _isLoading;

  List<Payment> get pendingPayments {
    return _payments.where((p) => p.status == PaymentStatus.pending).toList();
  }

  double get totalPendingAmount {
    return pendingPayments.fold(0, (sum, payment) => sum + payment.amount);
  }

  PaymentProvider() {
    loadPayments();
  }

  Future<void> loadPayments() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));
    _payments = MockDataService.getPayments();

    _isLoading = false;
    notifyListeners();
  }

  void selectPayment(Payment payment) {
    _selectedPayment = payment;
    notifyListeners();
  }

  Future<Payment?> collectPayment({
    required String customerId,
    required String customerName,
    required double amount,
    required PaymentMode mode,
    String? transactionId,
    String? chequeNumber,
    DateTime? chequeDate,
    String? bankName,
    String? notes,
    String? orderId,
  }) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    final payment = Payment(
      id: 'PAY${DateTime.now().millisecondsSinceEpoch}',
      customerId: customerId,
      customerName: customerName,
      salesRepId: 'U001',
      salesRepName: 'Rajesh Kumar',
      amount: amount,
      mode: mode,
      status: mode == PaymentMode.cheque ? PaymentStatus.pending : PaymentStatus.completed,
      paymentDate: DateTime.now(),
      transactionId: transactionId,
      chequeNumber: chequeNumber,
      chequeDate: chequeDate,
      bankName: bankName,
      notes: notes,
      orderId: orderId,
    );

    _payments.insert(0, payment);

    _isLoading = false;
    notifyListeners();

    return payment;
  }

  Future<void> updatePaymentStatus(String paymentId, PaymentStatus status) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));

    final index = _payments.indexWhere((p) => p.id == paymentId);
    if (index != -1) {
      final payment = _payments[index];
      _payments[index] = Payment(
        id: payment.id,
        customerId: payment.customerId,
        customerName: payment.customerName,
        salesRepId: payment.salesRepId,
        salesRepName: payment.salesRepName,
        amount: payment.amount,
        mode: payment.mode,
        status: status,
        paymentDate: payment.paymentDate,
        transactionId: payment.transactionId,
        chequeNumber: payment.chequeNumber,
        chequeDate: payment.chequeDate,
        bankName: payment.bankName,
        notes: payment.notes,
        orderId: payment.orderId,
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
