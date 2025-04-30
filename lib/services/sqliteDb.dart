import 'package:esquema_vacunacion_app/models/vacuna.dart';
import 'package:sqflite/sqflite.dart';

import '../models/listaVcunas.dart';

class VacunaDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath() + 'vacuna.db';
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE Vacuna (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        clasificacion TEXT,
        nombre TEXT,
        descripcion TEXT,
        paraQueEs TEXT,
        efectosSecundarios TEXT,
        reaccionesAdversas TEXT,
        cantidadDosis INTEGER,
        fechasAplicacion TEXT
      )
    ''');
    });
  }

  Future<void> insertVacuna(Vacuna vacuna) async {
    var map =vacuna.toMap();
    final db = await database;
    await db.insert(
      'Vacuna',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Vacuna>> getVacunas() async {
    final db = await database;
    await insertVacunasIfEmpty();
    final maps = await db.query('Vacuna');
    return List.generate(maps.length, (i) {
      return Vacuna.fromMap(maps[i]);
    });
  }

  Future<void> insertVacunasIfEmpty() async {
    final db = await database;
    final count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Vacuna'));

    if (count == 0) {
      List<Vacuna> vacunas = getListaVacunasDesdeJson();
      for (var vacuna in vacunas) {
        await insertVacuna(vacuna);
      }
    }
  }
}
