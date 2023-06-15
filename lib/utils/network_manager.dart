import 'package:dio/dio.dart';

import '../model/todo_item.dart';

class NetworkManager {
  late final Dio _dio;
  final baseUrl =
      'https://d7ed-2400-9800-c35-4b2b-18e6-7aef-c270-a40c.ngrok-free.app/';
  NetworkManager() {
    _dio = Dio();
  }

  Future<List<TodoItem>> getTodosIsDone(bool isDone) async {
    final result = await _dio.get(
      '$baseUrl/todos?isDone=$isDone',
    );
    return (result.data as List).map((e) => TodoItem.fromMap(e)).toList();
  }

  Future<TodoItem> postData(TodoItem item) async {
    final result = await _dio.post(
      '$baseUrl/todos',
      data: item.toMap(),
    );

    return TodoItem.fromMap(result.data);
  }

  Future<TodoItem> updateData(TodoItem item) async {
    final result =
        await _dio.put('$baseUrl/todos/${item.id}', data: item.toMap());

    return TodoItem.fromMap(result.data);
  }

  Future<void> deleteData(TodoItem item) async {
    await _dio.delete('$baseUrl/todos/${item.id}');
  }
}
