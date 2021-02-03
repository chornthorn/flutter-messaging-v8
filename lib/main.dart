import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'core/errors/failure.dart';
import 'data/datasource/firebase/messages/message.firebase.datasource.dart';
import 'data/service/messages/message.firebase.service.dart';
import 'domain/entity/messages/message_req_entity.dart';
import 'domain/repository/messages/message.firebase.repository.dart';
import 'domain/usecase/messages/firebase/get_message_usecase.dart';
import 'domain/usecase/messages/firebase/save_message_usecase.dart';
import 'index.dart';

import 'config/flavors/flavor_config.dart';
import 'config/flavors/flavor_environment.dart';
import 'view/state/getx/controller/message.controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FlavorConfig(
    environment: FlavorEnvironment.PRD,
    name: "PROD",
    color: Colors.red,
    location: BannerLocation.bottomEnd,
    variables: {
      "baseUrl": "https://www.facebook.com",
    },
  );

  runApp(AppIndex());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  var uuid = Uuid();
  MessageReqDataEntity reqDataEntity = MessageReqDataEntity(
    id: uuid.v4(),
    messageBody: message.notification.body,
    messageTitle: message.notification.title,
  );
  var options = SetOptions(merge: true);
  return _db
      .collection('message_list')
      .doc(reqDataEntity.id)
      .set(reqDataEntity.toJson(), options);
}
