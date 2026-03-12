import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Reports & Analytics'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildReportCard(
              context,
              'Sales Report',
              'Daily, weekly and monthly sales performance',
              Icons.trending_up,
              AppColors.success,
            ),
            _buildReportCard(
              context,
              'Order Report',
              'Order statistics and trends',
              Icons.shopping_cart,
              AppColors.info,
            ),
            _buildReportCard(
              context,
              'Visit Report',
              'Customer visit analytics',
              Icons.location_on,
              AppColors.warning,
            ),
            _buildReportCard(
              context,
              'Payment Report',
              'Payment collection analysis',
              Icons.payment,
              AppColors.success,
            ),
            _buildReportCard(
              context,
              'Product Performance',
              'Top selling products and inventory',
              Icons.inventory_2,
              AppColors.primary,
            ),
            _buildReportCard(
              context,
              'Employee Performance',
              'Team performance metrics',
              Icons.people,
              AppColors.accent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title coming soon')),
          );
        },
      ),
    );
  }
}
