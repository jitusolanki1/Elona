import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/formatters.dart';
import '../../services/mock_data_service.dart';
import '../../models/expense_model.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenses = MockDataService.getExpenses();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Expenses'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(_getExpenseIcon(expense.type), color: AppColors.error),
              title: Text(expense.description),
              subtitle: Text(
                '${expense.type.toString().split('.').last} • ${Formatters.formatDate(expense.expenseDate)}',
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Formatters.formatCurrency(expense.amount),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: _getStatusColor(expense.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      expense.status.toString().split('.').last,
                      style: TextStyle(
                        fontSize: 10,
                        color: _getStatusColor(expense.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Add expense feature coming soon')),
          );
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add),
      ),
    );
  }

  IconData _getExpenseIcon(ExpenseType type) {
    switch (type) {
      case ExpenseType.fuel:
        return Icons.local_gas_station;
      case ExpenseType.food:
        return Icons.restaurant;
      case ExpenseType.travel:
        return Icons.directions_car;
      case ExpenseType.accommodation:
        return Icons.hotel;
      case ExpenseType.other:
        return Icons.receipt;
    }
  }

  Color _getStatusColor(ExpenseStatus status) {
    switch (status) {
      case ExpenseStatus.pending:
        return AppColors.warning;
      case ExpenseStatus.approved:
        return AppColors.success;
      case ExpenseStatus.rejected:
        return AppColors.error;
    }
  }
}
