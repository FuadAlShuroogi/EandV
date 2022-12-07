import 'package:eandv/constants.dart';
import 'package:eandv/screens/notification.dart';
import 'package:flutter/material.dart';

class NotificationManage extends StatefulWidget {
  const NotificationManage({super.key});

  @override
  State<NotificationManage> createState() => _NotificationManageState();
}

class _NotificationManageState extends State<NotificationManage> {
  void initState() {
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          // elevation: 0.0,
          // titleSpacing: 10.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
          title: Text("Notifcations Management"),
        ),
        body: Container(
            child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            width: 200,
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                Noti.showBigTextNotification(
                    title: "New Upcoming Event",
                    body: "Bahrain Festive Season 🇧🇭",
                    fln: flutterLocalNotificationsPlugin);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              child: Text(
                "Test Notifcation",
              ),
            ),
          ),
        )),
      ),
    );
  }
}
