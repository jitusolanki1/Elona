import 'package:flutter/material.dart';
import '../models/dashboard_model.dart';
import '../services/mock_data_service.dart';

class DashboardProvider with ChangeNotifier {
  DashboardStats? _stats;
  bool _isLoading = false;

  DashboardStats? get stats => _stats;
  bool get isLoading => _isLoading;

  DashboardProvider() {
    loadDashboardStats();
  }

  Future<void> loadDashboardStats() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 800));
    _stats = MockDataService.getDashboardStats();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await loadDashboardStats();
  }
}
