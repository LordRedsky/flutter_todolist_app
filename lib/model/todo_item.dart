// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoItem {
  final int? id;
  final String title;
  final String description;
  final bool isDone;

  TodoItem(this.id, this.title, this.description, this.isDone);
  // final bool completed;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      map['id'] != null ? map['id'] as int : null,
      map['title'] as String,
      map['description'] as String,
      map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItem.fromJson(String source) =>
      TodoItem.fromMap(json.decode(source) as Map<String, dynamic>);

  TodoItem copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return TodoItem(
      id ?? this.id,
      title ?? this.title,
      description ?? this.description,
      isDone ?? this.isDone,
    );
  }

  @override
  String toString() {
    return 'TodoItem(id: $id, title: $title, description: $description, isDone: $isDone)';
  }
}
