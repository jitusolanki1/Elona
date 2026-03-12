import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/auth_provider.dart';
import '../payments/payment_list_screen.dart';
import '../expenses/expense_list_screen.dart';
import '../employees/employee_list_screen.dart';
import '../targets/target_list_screen.dart';
import '../reports/reports_screen.dart';
import '../settings/settings_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserProfile(context),
            SizedBox(height: 16),
            _buildModuleGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    final user = context.watch<AuthProvider>().currentUser;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.primary,
            child: Text(
              user?.name[0].toUpperCase() ?? 'U',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.name ?? 'User',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user?.email ?? '',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  user?.designation ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModuleGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildModuleCard(
          context,
          'Payments',
          Icons.payment,
          AppColors.success,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentListScreen()),
          ),
        ),
        _buildModuleCard(
          context,
          'Expenses',
          Icons.receipt_long,
          AppColors.error,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExpenseListScreen()),
          ),
        ),
        _buildModuleCard(
          context,
          'Employees',
          Icons.people,
          AppColors.info,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmployeeListScreen()),
          ),
        ),
        _buildModuleCard(
          context,
          'Targets',
          Icons.track_changes,
          AppColors.accent,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TargetListScreen()),
          ),
        ),
        _buildModuleCard(
          context,
          'Reports',
          Icons.bar_chart,
          AppColors.primary,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReportsScreen()),
          ),
        ),
        _buildModuleCard(
          context,
          'Field Tracking',
          Icons.location_on,
          AppColors.warning,
          () => Navigator.pushNamed(context, '/field-tracking'),
        ),
        _buildModuleCard(
          context,
          'Beat Planning',
          Icons.route,
          AppColors.info,
          () => Navigator.pushNamed(context, '/beat-planning'),
        ),
        _buildModuleCard(
          context,
          'Inventory',
          Icons.inventory,
          AppColors.success,
          () => Navigator.pushNamed(context, '/inventory'),
        ),
        _buildModuleCard(
          context,
          'Tasks',
          Icons.task_alt,
          Colors.purple,
          () => Navigator.pushNamed(context, '/tasks'),
        ),
        _buildModuleCard(
          context,
          'Messages',
          Icons.message,
          Colors.teal,
          () => Navigator.pushNamed(context, '/communication'),
        ),
        _buildModuleCard(
          context,
          'Settings',
          Icons.settings,
          AppColors.textSecondary,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          ),
        ),
      ],
    );
  }

  Widget _buildModuleCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
