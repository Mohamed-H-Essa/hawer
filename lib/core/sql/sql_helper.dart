import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const String tableSaved = 'saved';
const String columnId = '_id';
const String columnWord = 'word';
const String columnVideoPath = 'videoPath';
const String columnDate = 'date';

class SavedItem {
  int? id;
  late String word;
  late String videoPath;
  late String date;

  SavedItem({
    this.id,
    required this.word,
    required this.videoPath,
    required this.date,
  });

  SavedItem.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    word = map[columnWord];
    videoPath = map[columnVideoPath];
    date = map[columnDate];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnWord: word,
      columnVideoPath: videoPath,
      columnDate: date
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  // to string

  @override
  String toString() {
    return 'Saved{id: $id, word: $word, videoPath: $videoPath, date: $date}';
  }
}

class SavedProvider {
  Database? db;
  SavedProvider({
    this.db,
  });

  Future open({String path = ''}) async {
    if (path == '') {
      path = await getDatabasesPath();
      path = '${path}saved.db';
    }

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tableSaved ( 
            $columnId integer primary key autoincrement,  
            $columnWord text not null,
            $columnVideoPath text not null,
            $columnDate text not null)
          ''');
    });
  }

  Future<SavedItem> insert(SavedItem saved) async {
    saved.id = await db!.insert(tableSaved, saved.toMap());
    return saved;
  }

  Future<List<SavedItem>> getSaved() async {
    List<Map<String, dynamic>> maps = await db!.query(tableSaved);
    List<SavedItem> savedItems = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        savedItems.add(SavedItem.fromMap(maps[i]));
      }
    }
    return savedItems;
  }

  Future<SavedItem> getSavedById(int id) async {
    List<Map<String, dynamic>> maps =
        await db!.query(tableSaved, where: '$columnId = ?', whereArgs: [id]);
    return SavedItem.fromMap(maps.first);
  }

  Future<int> delete(int id) async {
    return await db!
        .delete(tableSaved, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(SavedItem saved) async {
    return await db!.update(tableSaved, saved.toMap(),
        where: '$columnId = ?', whereArgs: [saved.id]);
  }

  Future close() async => db!.close();
}

// save video using application documents directory with date now as its name and store saved item in database
Future<void> saveVideoToDB(String word, Uint8List videoBytes) async {
  print('begin save video');
  // get application documents directory
  final Directory extDir = await getApplicationDocumentsDirectory();
  print(extDir.path);

  // get date now
  DateTime now = DateTime.now();

  // create directory with date now as its name
  Directory dir = Directory(extDir.path);

  // create directory
  // await dir.create();

  // create file with date now as its name
  File file = File('${dir.path}/${now.toString()}.mp4');
  print(file.path);

  // write video bytes to file
  await file.writeAsBytes(videoBytes);

  // get date now as string
  String date = now.toString();

  // create saved item
  SavedItem saved = SavedItem(
    word: word,
    videoPath: file.path,
    date: date,
  );

  // open database
  SavedProvider savedProvider = SavedProvider();
  await savedProvider.open();

  // insert saved item to database
  await savedProvider.insert(saved);

  // close database
  await savedProvider.close();
  print('end save video');
}

// get saved videos

Future<List<SavedItem>> getSavedVideos() async {
  SavedProvider savedProvider = SavedProvider();
  await savedProvider.open();
  List<SavedItem> savedItems = await savedProvider.getSaved();
  await savedProvider.close();
  return savedItems;
}
