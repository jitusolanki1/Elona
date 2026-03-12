import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/formatters.dart';
import '../../models/task_model.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock tasks
    final tasks = _getMockTasks();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getPriorityColor(task.priority).withAlpha(25),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getTaskIcon(task.status),
                  color: _getStatusColor(task.status),
                ),
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: task.status == TaskStatus.completed
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(task.description),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 12, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(
                        'Due: ${Formatters.formatDate(task.dueDate)}',
                        style: TextStyle(
                          fontSize: 11,
                          color: task.isOverdue ? AppColors.error : AppColors.textSecondary,
                          fontWeight: task.isOverdue ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getPriorityColor(task.priority).withAlpha(25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      task.priority.toString().split('.').last.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        color: _getPriorityColor(task.priority),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/task-detail', arguments: task);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-task');
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Task> _getMockTasks() {
    return [
      Task(
        id: '1',
        title: 'Visit Metro Cash & Carry',
        description: 'Discuss new product launch and take order',
        assignedTo: 'Rajesh Kumar',
        assignedBy: 'Sales Manager',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        createdDate: DateTime.now().subtract(const Duration(days: 2)),
        status: TaskStatus.pending,
        priority: TaskPriority.high,
      ),
      Task(
        id: '2',
        title: 'Collect payment from D-Mart',
        description: 'Outstanding amount: ₹45,000',
        assignedTo: 'Amit Sharma',
        assignedBy: 'Sales Manager',
        dueDate: DateTime.now(),
        createdDate: DateTime.now().subtract(const Duration(days: 5)),
        status: TaskStatus.inProgress,
        priority: TaskPriority.urgent,
      ),
      Task(
        id: '3',
        title: 'Stock audit at warehouse',
        description: 'Verify physical stock vs system stock',
        assignedTo: 'Priya Singh',
        assignedBy: 'Admin',
        dueDate: DateTime.now().add(const Duration(days: 3)),
        createdDate: DateTime.now().subtract(const Duration(days: 1)),
        status: TaskStatus.completed,
        priority: TaskPriority.medium,
        completedDate: DateTime.now(),
      ),
      Task(
        id: '4',
        title: 'Submit expense report',
        description: 'Month end expense reconciliation',
        assignedTo: 'Suresh Patel',
        assignedBy: 'Finance',
        dueDate: DateTime.now().subtract(const Duration(days: 1)),
        createdDate: DateTime.now().subtract(const Duration(days: 10)),
        status: TaskStatus.pending,
        priority: TaskPriority.high,
      ),
    ];
  }

  IconData _getTaskIcon(TaskStatus status) {
    switch (status) {
      case TaskStatus.completed:
        return Icons.check_circle;
      case TaskStatus.inProgress:
        return Icons.pending;
      case TaskStatus.pending:
        return Icons.schedule;
      case TaskStatus.cancelled:
        return Icons.cancel;
    }
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.completed:
        return AppColors.success;
      case TaskStatus.inProgress:
        return AppColors.info;
      case TaskStatus.pending:
        return AppColors.warning;
      case TaskStatus.cancelled:
        return AppColors.error;
    }
  }

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return AppColors.info;
      case TaskPriority.medium:
        return AppColors.warning;
      case TaskPriority.high:
        return Colors.deepOrange;
      case TaskPriority.urgent:
        return AppColors.error;
    }
  }
}
