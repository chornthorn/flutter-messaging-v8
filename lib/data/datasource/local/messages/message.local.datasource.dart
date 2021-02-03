import 'dart:io';
import '../../../model/messages/message.local.model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MessageLocalDataSource {
  static final MessageLocalDataSource instance =
      MessageLocalDataSource._instance();
  static Database _db;
  MessageLocalDataSource._instance();

  String messageTable = 'message_table';
  String colId = 'id';
  String colUserName = 'userName';
  String colModuleName = 'moduleName';
  String colMessageSubject = 'messageSubject';
  String colMessageTitle = 'messageTitle';
  String colMessageBody = 'messageBody';
  String colMessageStatus = 'messageStatus';
  String colMessageCircleAvatar = 'messageCircleAvatar';
  String colCreatedDate = 'createdDate';
  String colUpdatedDate = 'updatedDate';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/todo_list.db';
    final todoListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $messageTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, 
      $colUserName TEXT,
      $colModuleName TEXT,
      $colMessageSubject TEXT,
      $colMessageTitle TEXT,
      $colMessageBody TEXT,
      $colMessageStatus TEXT,
      $colMessageCircleAvatar TEXT,
      $colCreatedDate TEXT,
      $colUpdatedDate TEXT)
      ''',
    );
  }

  Future<List<Map<String, dynamic>>> getMessageMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(messageTable);
    return result;
  }

  Future<List<MessageLocalModel>> getMessageList() async {
    final List<Map<String, dynamic>> messageMapList = await getMessageMapList();
    final List<MessageLocalModel> messageList = [];
    messageMapList.forEach((messageMap) {
      messageList.add(MessageLocalModel.fromMap(messageMap));
    });

    return messageList;
  }

  Future<int> insertMessage(MessageLocalModel message) async {
    Database db = await this.db;
    final int result = await db.insert(messageTable, message.toMap());
    return result;
  }

  Future<int> updateMessage(MessageLocalModel message) async {
    Database db = await this.db;
    final int result = await db.update(
      messageTable,
      message.toMap(),
      where: '$colId = ?',
      whereArgs: [message.id],
    );
    return result;
  }

  Future<int> deleteMessage(int id) async {
    Database db = await this.db;
    final int result = await db.delete(
      messageTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }
}
