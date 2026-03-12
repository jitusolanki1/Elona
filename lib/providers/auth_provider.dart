import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/mock_data_service.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _currentUser != null;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2)); // Simulate API call

    // Simple validation
    if (email.isNotEmpty && password.isNotEmpty) {
      _currentUser = MockDataService.getCurrentUser();
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'Invalid credentials';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String name, String email, String password, String phone) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    _currentUser = User(
      id: 'U${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      phone: phone,
      role: UserRole.salesRep,
      joinDate: DateTime.now(),
    );

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();
  }

  Future<bool> forgotPassword(String email) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> verifyOTP(String otp) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    _isLoading = false;
    notifyListeners();
    return otp == '123456'; // Mock OTP verification
  }

  Future<bool> resetPassword(String newPassword) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    _isLoading = false;
    notifyListeners();
    return true;
  }
}
