import 'package:flutter/material.dart';
import '../../../../core/networks/http.dart';

abstract class MessageRemoteDataSource {
  Future<void> getMessage();
  Future<void> readMessage();
  Future<void> deleteMessage();
  Future<void> updateMessage();
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final CustomHttp _customHttp;

  MessageRemoteDataSourceImpl({@required CustomHttp customHttp})
      : assert(customHttp != null, 'custom http should not be null'),
        _customHttp = customHttp;

  @override
  Future<void> deleteMessage() {
    // TODO: implement deleteMessage
    throw UnimplementedError();
  }

  @override
  Future<void> getMessage() {
    // TODO: implement getMessage
    throw UnimplementedError();
  }

  @override
  Future<void> readMessage() {
    // TODO: implement readMessage
    throw UnimplementedError();
  }

  @override
  Future<void> updateMessage() {
    // TODO: implement updateMessage
    throw UnimplementedError();
  }

}
