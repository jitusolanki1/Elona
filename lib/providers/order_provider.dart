import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../services/mock_data_service.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  Order? _selectedOrder;
  bool _isLoading = false;

  // For creating new order
  List<OrderItem> _currentOrderItems = [];
  String? _selectedCustomerId;
  String? _selectedCustomerName;

  List<Order> get orders => _orders;
  Order? get selectedOrder => _selectedOrder;
  bool get isLoading => _isLoading;
  List<OrderItem> get currentOrderItems => _currentOrderItems;
  String? get selectedCustomerId => _selectedCustomerId;
  String? get selectedCustomerName => _selectedCustomerName;

  double get currentOrderSubtotal {
    return _currentOrderItems.fold(0, (sum, item) => sum + item.subtotal);
  }

  double get currentOrderTotal {
    return _currentOrderItems.fold(0, (sum, item) => sum + item.total);
  }

  OrderProvider() {
    loadOrders();
  }

  Future<void> loadOrders() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));
    _orders = MockDataService.getOrders();

    _isLoading = false;
    notifyListeners();
  }

  void selectOrder(Order order) {
    _selectedOrder = order;
    notifyListeners();
  }

  void setSelectedCustomer(String customerId, String customerName) {
    _selectedCustomerId = customerId;
    _selectedCustomerName = customerName;
    notifyListeners();
  }

  void addItemToCurrentOrder(OrderItem item) {
    final existingIndex = _currentOrderItems.indexWhere(
      (i) => i.productId == item.productId,
    );

    if (existingIndex != -1) {
      _currentOrderItems[existingIndex] = OrderItem(
        productId: item.productId,
        productName: item.productName,
        quantity: _currentOrderItems[existingIndex].quantity + item.quantity,
        price: item.price,
        discount: item.discount,
        gst: item.gst,
      );
    } else {
      _currentOrderItems.add(item);
    }
    notifyListeners();
  }

  void removeItemFromCurrentOrder(String productId) {
    _currentOrderItems.removeWhere((item) => item.productId == productId);
    notifyListeners();
  }

  void updateOrderItemQuantity(String productId, int quantity) {
    final index = _currentOrderItems.indexWhere((i) => i.productId == productId);
    if (index != -1) {
      final item = _currentOrderItems[index];
      _currentOrderItems[index] = OrderItem(
        productId: item.productId,
        productName: item.productName,
        quantity: quantity,
        price: item.price,
        discount: item.discount,
        gst: item.gst,
      );
      notifyListeners();
    }
  }

  Future<Order?> createOrder(String notes) async {
    if (_selectedCustomerId == null || _currentOrderItems.isEmpty) {
      return null;
    }

    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    final subtotal = currentOrderSubtotal;
    final totalDiscount = _currentOrderItems.fold(0.0, (sum, item) => sum + item.discountAmount);
    final totalGst = _currentOrderItems.fold(0.0, (sum, item) => sum + item.gstAmount);
    final total = currentOrderTotal;

    final order = Order(
      id: 'ORD${DateTime.now().millisecondsSinceEpoch}',
      customerId: _selectedCustomerId!,
      customerName: _selectedCustomerName!,
      salesRepId: 'U001',
      salesRepName: 'Rajesh Kumar',
      orderDate: DateTime.now(),
      items: List.from(_currentOrderItems),
      subtotal: subtotal,
      discount: totalDiscount,
      gstAmount: totalGst,
      totalAmount: total,
      status: OrderStatus.pending,
      notes: notes,
      invoiceNumber: 'INV-${DateTime.now().year}-${(_orders.length + 1).toString().padLeft(3, '0')}',
    );

    _orders.insert(0, order);
    clearCurrentOrder();

    _isLoading = false;
    notifyListeners();

    return order;
  }

  void clearCurrentOrder() {
    _currentOrderItems.clear();
    _selectedCustomerId = null;
    _selectedCustomerName = null;
    notifyListeners();
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));

    final index = _orders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      final order = _orders[index];
      _orders[index] = Order(
        id: order.id,
        customerId: order.customerId,
        customerName: order.customerName,
        salesRepId: order.salesRepId,
        salesRepName: order.salesRepName,
        orderDate: order.orderDate,
        items: order.items,
        subtotal: order.subtotal,
        discount: order.discount,
        gstAmount: order.gstAmount,
        totalAmount: order.totalAmount,
        status: status,
        notes: order.notes,
        deliveryDate: order.deliveryDate,
        invoiceNumber: order.invoiceNumber,
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
