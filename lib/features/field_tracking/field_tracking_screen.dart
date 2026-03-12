import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/formatters.dart';
import '../../services/mock_data_service.dart';

class FieldTrackingScreen extends StatelessWidget {
  const FieldTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visits = MockDataService.getCustomerVisits();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Field Tracking'),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Map view coming soon')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTodayStats(context),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: visits.length,
              itemBuilder: (context, index) {
                final visit = visits[index];
                final customer = MockDataService.getCustomers().firstWhere(
                  (c) => c.id == visit.customerId,
                  orElse: () => MockDataService.getCustomers().first,
                );

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _getStatusColor(visit.status).withAlpha(25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: _getStatusColor(visit.status),
                      ),
                    ),
                    title: Text(
                      customer.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(visit.purpose ?? 'Customer visit'),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 12, color: AppColors.textSecondary),
                            const SizedBox(width: 4),
                            Text(
                              Formatters.formatDateTime(visit.visitDate),
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        if (visit.feedback != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            visit.feedback!,
                            style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(visit.status).withAlpha(25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        visit.status.toString().split('.').last.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          color: _getStatusColor(visit.status),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Start new visit coming soon')),
          );
        },
        backgroundColor: AppColors.success,
        icon: const Icon(Icons.add_location),
        label: const Text('Start Visit'),
      ),
    );
  }

  Widget _buildTodayStats(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard('Planned', '8', AppColors.info),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard('Completed', '5', AppColors.success),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard('Pending', '3', AppColors.warning),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(status) {
    final statusStr = status.toString();
    if (statusStr.contains('completed')) {
      return AppColors.success;
    } else if (statusStr.contains('planned')) {
      return AppColors.info;
    } else {
      return AppColors.warning;
    }
  }
}
