enum TaskStatus { pending, inProgress, completed, cancelled }
enum TaskPriority { low, medium, high, urgent }

class Task {
  final String id;
  final String title;
  final String description;
  final String assignedTo;
  final String assignedBy;
  final DateTime dueDate;
  final DateTime createdDate;
  final TaskStatus status;
  final TaskPriority priority;
  final String? notes;
  final DateTime? completedDate;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.assignedTo,
    required this.assignedBy,
    required this.dueDate,
    required this.createdDate,
    required this.status,
    required this.priority,
    this.notes,
    this.completedDate,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      assignedTo: json['assignedTo'],
      assignedBy: json['assignedBy'],
      dueDate: DateTime.parse(json['dueDate']),
      createdDate: DateTime.parse(json['createdDate']),
      status: TaskStatus.values.firstWhere((e) => e.toString() == json['status']),
      priority: TaskPriority.values.firstWhere((e) => e.toString() == json['priority']),
      notes: json['notes'],
      completedDate: json['completedDate'] != null ? DateTime.parse(json['completedDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'assignedTo': assignedTo,
      'assignedBy': assignedBy,
      'dueDate': dueDate.toIso8601String(),
      'createdDate': createdDate.toIso8601String(),
      'status': status.toString(),
      'priority': priority.toString(),
      'notes': notes,
      'completedDate': completedDate?.toIso8601String(),
    };
  }

  bool get isOverdue => status != TaskStatus.completed && DateTime.now().isAfter(dueDate);
}
