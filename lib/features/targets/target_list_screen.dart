import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/formatters.dart';
import '../../services/mock_data_service.dart';

class TargetListScreen extends StatelessWidget {
  const TargetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final targets = MockDataService.getTargets();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Sales Targets'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: targets.length,
        itemBuilder: (context, index) {
          final target = targets[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        target.employeeName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          target.period,
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildTargetProgress(
                    'Sales Target',
                    target.salesAchieved,
                    target.salesTarget,
                    target.salesAchievementPercentage,
                  ),
                  SizedBox(height: 12),
                  _buildTargetProgress(
                    'Order Target',
                    target.orderAchieved.toDouble(),
                    target.orderTarget.toDouble(),
                    target.orderAchievementPercentage,
                    isCurrency: false,
                  ),
                  SizedBox(height: 12),
                  _buildTargetProgress(
                    'Visit Target',
                    target.visitAchieved.toDouble(),
                    target.visitTarget.toDouble(),
                    target.visitAchievementPercentage,
                    isCurrency: false,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTargetProgress(
    String label,
    double achieved,
    double target,
    double percentage, {
    bool isCurrency = true,
  }) {
    final color = percentage >= 100
        ? AppColors.success
        : percentage >= 75
            ? AppColors.primary
            : percentage >= 50
                ? AppColors.warning
                : AppColors.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: AppColors.divider,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isCurrency
                  ? Formatters.formatCurrency(achieved)
                  : achieved.toInt().toString(),
              style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
            ),
            Text(
              isCurrency
                  ? Formatters.formatCurrency(target)
                  : target.toInt().toString(),
              style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
