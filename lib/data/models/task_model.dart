import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final String icon;
  final String time;
  bool? isdeleted;

  Task({
    required this.title,
    required this.icon,
    required this.description,
    required this.time,
    this.isdeleted,
  }) {
    isdeleted = isdeleted ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? icon,
    String? time,
    bool? isdeleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      time: time ?? this.time,
      isdeleted: isdeleted ?? this.isdeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'icon': icon,
      'time' : time,
      'isdeleted': isdeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      icon: map['icon'] ?? '',
      time: map['time'] ?? '',
      isdeleted: map['isdeleted'],
    );
  }

  @override
  List<Object?> get props =>
      [
        title,
        time,
        description,
        icon,
        isdeleted,
      ];
}
