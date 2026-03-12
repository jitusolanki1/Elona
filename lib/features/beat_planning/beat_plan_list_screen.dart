import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../services/mock_data_service.dart';

class BeatPlanListScreen extends StatelessWidget {
  const BeatPlanListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beatPlans = MockDataService.getBeatPlans();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Beat Plans'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: beatPlans.length,
        itemBuilder: (context, index) {
          final beat = beatPlans[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Text(
                  beat.dayOfWeek.substring(0, 2).toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                '${beat.dayOfWeek} - ${beat.territory}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${beat.customerIds.length} customers planned'),
              children: beat.customerIds.map((customerId) {
                final customer = MockDataService.getCustomers().firstWhere(
                  (c) => c.id == customerId,
                  orElse: () => MockDataService.getCustomers().first,
                );
                return ListTile(
                  dense: true,
                  leading: const Icon(Icons.store, size: 20),
                  title: Text(customer.name),
                  subtitle: Text(customer.address),
                  trailing: Icon(
                    Icons.navigation,
                    color: AppColors.info,
                    size: 20,
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Navigate to ${customer.name}')),
                    );
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create beat plan coming soon')),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
