enum NoteStatus { Pending, Ongoing, Completed }

class Note {
  final int id;
  final String title;
  final String content;
  final NoteStatus status;
  final DateTime dateTime;
  final bool isNotificationOn;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.status,
    required this.dateTime,
    required this.isNotificationOn,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      status: parseStatus(json['status']),
      dateTime: DateTime.parse(json['dateTime'] as String),
      isNotificationOn: json['isNotificationOn'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'status': status.name,
      'dateTime': dateTime.toIso8601String(),
      'isNotificationOn': isNotificationOn,
    };
  }

  static NoteStatus parseStatus(String status) {
    switch (status) {
      case 'Pending':
        return NoteStatus.Pending;
      case 'Ongoing':
        return NoteStatus.Ongoing;
      case 'Completed':
        return NoteStatus.Completed;
      default:
        throw Exception('Unknown status: $status');
    }
  }
}
