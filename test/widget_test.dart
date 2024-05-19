// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:task_manager_app/core/data/datasource/base_local_sqlite_database.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';

// void main() {
//    setUpAll(() {
//     // Initialize FFI
//     sqfliteFfiInit();
//     // Change the default factory for unit testing calls for SQFlite
//     databaseFactory = databaseFactoryFfi;
//     // database = Database();
//   });

//   group('CRUD TEST', () {
//       GetMyOccasionsModel task = GetMyOccasionsModel(completed: false,id: 258,todo: "new",userId: 654);
//         Future<int> future = DatabaseHelper.addTask(task);
//     test('add', () {
//          expect(future,  completion(equals(int)));

//     });

//   });
// }
void main() {
  setUpAll(() {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory for unit testing calls for SQFlite
    databaseFactory = databaseFactoryFfi;
    // database = Database();
  });
  group('Test database crud functions', () {
    TaskModel task = TaskModel(
        id: 1,
        todo: "Do something nice for someone I care about",
        userId: 26,
        completed: 1);

    test('add task', () {
//Act
      Future<int> future = DatabaseHelper.addTask(task);

//Assert
      expect(future, completion(1));
    });
  });
}
