import 'package:flutter/material.dart';
import '../models/customer_model.dart';
import '../services/mock_data_service.dart';

class CustomerProvider with ChangeNotifier {
  List<Customer> _customers = [];
  Customer? _selectedCustomer;
  bool _isLoading = false;
  String _searchQuery = '';

  List<Customer> get customers {
    if (_searchQuery.isEmpty) {
      return _customers;
    }
    return _customers.where((customer) {
      return customer.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          customer.phone.contains(_searchQuery) ||
          customer.city.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  Customer? get selectedCustomer => _selectedCustomer;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;

  CustomerProvider() {
    loadCustomers();
  }

  Future<void> loadCustomers() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));
    _customers = MockDataService.getCustomers();

    _isLoading = false;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void selectCustomer(Customer customer) {
    _selectedCustomer = customer;
    notifyListeners();
  }

  Future<void> addCustomer(Customer customer) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));
    _customers.add(customer);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateCustomer(Customer customer) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));
    final index = _customers.indexWhere((c) => c.id == customer.id);
    if (index != -1) {
      _customers[index] = customer;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteCustomer(String customerId) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));
    _customers.removeWhere((c) => c.id == customerId);

    _isLoading = false;
    notifyListeners();
  }
}
