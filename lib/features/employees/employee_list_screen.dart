import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../services/mock_data_service.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employees = MockDataService.getEmployees();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Employees'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Text(
                  employee.name[0].toUpperCase(),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(employee.name),
              subtitle: Text('${employee.designation} • ${employee.territory}'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to employee detail
              },
            ),
          );
        },
      ),
    );
  }
}
