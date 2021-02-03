import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/messages/message_res.firebase.dart';

class MessageFirebaseDatasource {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get topic list
  Stream<List<MessageResFirebaseModel>> getMessage() {
    return _db.collection('message_list').snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => MessageResFirebaseModel.fromJson(doc))
        .toList());
  }

  //create document
  Future<void> saveMessage(MessageResFirebaseModel messageModel) {
    var options = SetOptions(merge: true);
    return _db
        .collection('message_list')
        .doc(messageModel.id)
        .set(messageModel.toJson(), options);
  }

  //Update
  Future<void> updateTopicMessage(MessageResFirebaseModel messageModel) {
    return _db
        .collection('message_list')
        .doc(messageModel.id)
        .update(messageModel.toJson());
  }

  //Delete
  Future<void> removeEntry(String entryId) {
    return _db.collection('message_topic').doc(entryId).delete();
  }
}
