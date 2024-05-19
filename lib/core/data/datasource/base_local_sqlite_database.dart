import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_manager_app/features/Task/data/model/get_my_occasions_model.dart';

class DatabaseHelper{
  static const int _version = 1;
  static const String _dbName= "Tasks.db";

  static Future<Database> _getDB() async{

    return openDatabase(join(await getDatabasesPath(),_dbName),
    onCreate: (db, version)async =>
    await db.execute("CREATE TABLE TASK(id INTEGER PRIMARY KEY, todo TEXT NOT NULL, completed BOOLEAN,userId INTEGER);"),version: _version );
  }

  static Future<int> addTask(TaskModel task) async {
    final db = await _getDB();
        var replace;
replace= await db.insert("task", task.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
    return replace; 
    
  }

  static Future<int> addTasks(List<TaskModel> tasks) async {
    final db = await _getDB();
    var replace;
    for(int i=0; i<tasks.length;i++){

replace = await db.insert("task", tasks[i].toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return replace;
    
  }
    static Future<List<TaskModel>?> getAllTask() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Task");

    if(maps.isEmpty){
      return null;
    }
    return List.generate(maps.length, (index) => TaskModel.fromJson(maps[index]));
    
  }
}