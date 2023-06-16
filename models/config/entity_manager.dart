import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../main.dart';
import 'table.dart';

///#EntityManager
///the entity manager class for analyzing the database
///
///@author KyawZayarLynn crd.@author SaiZawMyint
class EntityManager {
  late Database _database;

  EntityManager() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  ///Initializing Database
  ///
  ///Parameters
  ///[List<Table>] tables
  Future<void> initDatabase(List<Table> tables) async {
    this._database = await openDatabase('$projectPath\\Car.db');
    await _checkTables(tables);
  }

///Checking Tables
///
///[List<Table>] tables
  Future<void> _checkTables(List<Table>? tables) async {
    if (tables == null || tables.length == 0) {
      return;
    }
    tables.forEach((table) async {
      final dbTables = await _tablesName();
      if (!dbTables.contains(table.getClassName())) {
        await database.execute(table.createQuery());
        print('Table with the name ${table.getClassName()} created');
      }
    });
  }

///Get the database's table names
///
///@return [List<String>]
  Future<List<String>> _tablesName() async {
    List<Map<String, dynamic>> tables = await database
        .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
    return tables.map((row) => row['name'] as String).toList();
  }

///get the database
///
///@return Database
  Database get database => _database;
}
