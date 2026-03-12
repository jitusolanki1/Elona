import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/app_colors.dart';
import 'providers/auth_provider.dart';
import 'providers/customer_provider.dart';
import 'providers/product_provider.dart';
import 'providers/order_provider.dart';
import 'providers/payment_provider.dart';
import 'providers/dashboard_provider.dart';

import 'models/customer_model.dart';
import 'models/product_model.dart';
import 'models/order_model.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/auth/forgot_password_screen.dart';
import 'features/auth/reset_password_screen.dart';
import 'features/home_screen.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/customers/customer_list_screen.dart';
import 'features/customers/customer_detail_screen.dart';
import 'features/customers/add_customer_screen.dart';
import 'features/products/product_list_screen.dart';
import 'features/products/product_detail_screen.dart';
import 'features/orders/order_list_screen.dart';
import 'features/orders/order_detail_screen.dart';
import 'features/orders/create_order_screen.dart';
import 'features/payments/payment_list_screen.dart';
import 'features/payments/collect_payment_screen.dart';
import 'features/expenses/expense_list_screen.dart';
import 'features/employees/employee_list_screen.dart';
import 'features/targets/target_list_screen.dart';
import 'features/reports/reports_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/tasks/task_list_screen.dart';
import 'features/beat_planning/beat_plan_list_screen.dart';
import 'features/field_tracking/field_tracking_screen.dart';
import 'features/inventory/inventory_list_screen.dart';
import 'features/communication/communication_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp(
        title: 'ELONA SFA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            primary: AppColors.primary,
            secondary: AppColors.accent,
            error: AppColors.error,
          ),
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: false,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          cardTheme: CardThemeData(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.divider),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.divider),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.error),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/forgot-password': (context) => ForgotPasswordScreen(),
          '/reset-password': (context) => ResetPasswordScreen(),
          '/home': (context) => HomeScreen(),
          '/dashboard': (context) => DashboardScreen(),
          '/customers': (context) => CustomerListScreen(),
          '/add-customer': (context) => AddCustomerScreen(),
          '/products': (context) => ProductListScreen(),
          '/orders': (context) => OrderListScreen(),
          '/create-order': (context) => CreateOrderScreen(),
          '/payments': (context) => PaymentListScreen(),
          '/collect-payment': (context) => CollectPaymentScreen(),
          '/expenses': (context) => ExpenseListScreen(),
          '/employees': (context) => EmployeeListScreen(),
          '/targets': (context) => TargetListScreen(),
          '/reports': (context) => ReportsScreen(),
          '/settings': (context) => SettingsScreen(),
          '/tasks': (context) => TaskListScreen(),
          '/beat-planning': (context) => BeatPlanListScreen(),
          '/field-tracking': (context) => FieldTrackingScreen(),
          '/inventory': (context) => InventoryListScreen(),
          '/communication': (context) => CommunicationScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/customer-detail') {
            final customer = settings.arguments as Customer;
            return MaterialPageRoute(
              builder: (context) => CustomerDetailScreen(customer: customer),
            );
          }
          if (settings.name == '/product-detail') {
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            );
          }
          if (settings.name == '/order-detail') {
            final order = settings.arguments as Order;
            return MaterialPageRoute(
              builder: (context) => OrderDetailScreen(order: order),
            );
          }
          return null;
        },
      ),
    );
  }
}
