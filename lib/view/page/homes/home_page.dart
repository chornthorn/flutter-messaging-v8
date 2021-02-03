import 'package:flutter/material.dart';
import '../../state/getx/controller/message.controller.dart';
import '../../state/getx/controller/notification.controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   alignment: Alignment.center,
            //   child: Text('Hello World'),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            //   child: OutlineButton(
            //     child: Text('Show Message'),
            //     onPressed: () async{
            //       Get.find<NotificationController>().showNotification();
            //     },
            //   ),
            // ),
            GetX<MessageController>(
              builder: (controller) {
                if(controller.isLoading){
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.messageResEntity.length,
                  itemBuilder: (context,index){
                    var dataState = controller.messageResEntity[index];
                    return ListTile(
                      title: Text(dataState.messageTitle),
                      subtitle: Text(dataState.messageBody),
                    );
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
