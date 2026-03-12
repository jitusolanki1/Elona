class Announcement {
  final String id;
  final String title;
  final String message;
  final String postedBy;
  final DateTime postedDate;
  final bool isImportant;
  final String? attachmentUrl;

  Announcement({
    required this.id,
    required this.title,
    required this.message,
    required this.postedBy,
    required this.postedDate,
    this.isImportant = false,
    this.attachmentUrl,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      postedBy: json['postedBy'],
      postedDate: DateTime.parse(json['postedDate']),
      isImportant: json['isImportant'] ?? false,
      attachmentUrl: json['attachmentUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'postedBy': postedBy,
      'postedDate': postedDate.toIso8601String(),
      'isImportant': isImportant,
      'attachmentUrl': attachmentUrl,
    };
  }
}

class AppNotification {
  final String id;
  final String title;
  final String message;
  final String type; // order, payment, visit, announcement
  final DateTime timestamp;
  final bool isRead;
  final String? relatedId;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    this.isRead = false,
    this.relatedId,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      type: json['type'],
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'] ?? false,
      relatedId: json['relatedId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'relatedId': relatedId,
    };
  }
}
