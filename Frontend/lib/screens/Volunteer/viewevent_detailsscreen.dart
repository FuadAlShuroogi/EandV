// // import 'package:eandv/model/event_model.dart';
// // import 'package:eandv/screens/Login/login_screen.dart';
// // import 'package:eandv/screens/Organizer/addevent_screen.dart';
// // import 'package:eandv/screens/Organizer/editevent_screen.dart';
// // import 'package:eandv/screens/profile.dart';
// // import 'package:flutter/material.dart';
// // import 'package:eandv/controller/event_controller.dart';
// // import 'package:get/get.dart';

// // class ViewEventScreen extends StatelessWidget {
// //   ViewEventScreen({Key? key}) : super(key: key);

// //   final EventController controller = Get.put(EventController());
// //   // EventModel model = EventModel();

// //   // signOut() async {
// //   //   await auth.signOut();
// //   //   Navigator.pushReplacement(
// //   //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     controller.getEvent();
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Event List'),
// //       ),
// //       body: GetBuilder<EventController>(
// //         builder: (controller) => controller.allEvent.isEmpty
// //             ? const Center(
// //                 child: Text('😔 NO DATA FOUND (: 😔'),
// //               )
// //             : ListView.builder(
// //                 itemCount: controller.allEvent.length,
// //                 itemBuilder: (context, index) {
// //                   print("THE INDEX IS ");
// //                   print(index);
// //                   print(context);
// //                   return SingleChildScrollView(
// //                     child: GestureDetector(
// //                       onTap: () {
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => const EditEventScreen()));
// //                       },
// //                       child: Container(
// //                         padding: EdgeInsets.all(11),
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                               border: Border.all(
// //                                   color: Colors.grey,
// //                                   style: BorderStyle.solid,
// //                                   width: 1.1),
// //                               borderRadius:
// //                                   BorderRadius.all(Radius.circular(11))),
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(8.1),
// //                             child: SingleChildScrollView(
// //                               child: Column(
// //                                 children: [
// //                                   const Text("Event Details"),
// //                                   const SizedBox(
// //                                     height: 1,
// //                                   ),
// //                                   Row(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       const Flexible(
// //                                         child: Text(
// //                                           "Event Title :",
// //                                           style: TextStyle(
// //                                               fontWeight: FontWeight.bold),
// //                                         ),
// //                                       ),
// //                                       Text(
// //                                         controller.allEvent[index].title
// //                                             .toString(),
// //                                         style: const TextStyle(
// //                                           fontSize: 16,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   Row(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       const Flexible(
// //                                         child: Text(
// //                                           "Event Description :",
// //                                           style: TextStyle(
// //                                               fontWeight: FontWeight.bold),
// //                                         ),
// //                                       ),
// //                                       Flexible(
// //                                         child: Text(
// //                                           controller.allEvent[index].description
// //                                               .toString(),
// //                                           // controller.allEvent[index].description,
// //                                           style: const TextStyle(
// //                                             fontSize: 16,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   Row(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       const Flexible(
// //                                         child: Text(
// //                                           "Required Volunteers :",
// //                                           style: TextStyle(
// //                                               fontWeight: FontWeight.bold),
// //                                         ),
// //                                       ),
// //                                       Text(
// //                                         controller.allEvent[index].members
// //                                             .toString(),
// //                                         // controller.allEvent[index].members.toString(),
// //                                         style: const TextStyle(
// //                                           fontSize: 16,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   Row(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       const Flexible(
// //                                         child: Text(
// //                                           "Event Date :",
// //                                           style: TextStyle(
// //                                               fontWeight: FontWeight.bold),
// //                                         ),
// //                                       ),
// //                                       Text(
// //                                         controller.allEvent[index].eventDate
// //                                             .toString()
// //                                             .substring(1, 11),
// //                                         style: const TextStyle(
// //                                           fontSize: 16,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   Row(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     children: [
// //                                       Expanded(
// //                                           flex: 1,
// //                                           child: Image.network(
// //                                               // model.image.toString(),
// //                                               controller.allEvent[index].image
// //                                                   .toString(),
// //                                               fit: BoxFit.fill)),
// //                                     ],
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:math';

// import 'package:eandv/controller/event_controller.dart';
// import 'package:eandv/model/event_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class ViewEventDetails extends StatelessWidget {
//   ViewEventDetails({Key? key}) : super(key: key);

//   final EventController controller = Get.put(EventController());
//   EventModel model = EventModel();

//   //  SliverAppBar(
//   //           backgroundColor: Colors.blueGrey,
//   //           expandedHeight: 300,
//   //           floating: true,
//   //           pinned: true,
//   //           snap: false,
//   //           flexibleSpace: FlexibleSpaceBar(
//   //             title: const Text("Sliver App Bar"),
//   //             centerTitle: true,
//   //             background: Image.network(
//   //               "https://boxon-vote.s3.me-south-1.amazonaws.com/uploads/photo-gallery/DSC_3074_1.jpg",
//   //               fit: BoxFit.cover,
//   //             ),
//   //           ),
//   //         );

//   @override
//   Widget build(BuildContext context) {
//     controller.getEvent();
//     return Scaffold(

//       body: GetBuilder<EventController>(
//         builder: (controller) => controller.allEvent.isEmpty
//             ? const Center(
//                 child: Text('😔 NO DATA FOUND (: 😔'),
//               )
//             : ListView.builder(
//                 itemCount: controller.allEvent.length,
//                 itemBuilder: (context, index) {
//                   return CustomScrollView(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ViewEventDetails()));
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Colors.grey,
//                                   style: BorderStyle.solid,
//                                   width: 1.0),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10))),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   const Text("Event Details"),
//                                   const SizedBox(
//                                     height: 0,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Flexible(
//                                         child: Text(
//                                           "Event Title :",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                       Text(
//                                         controller.allEvent[index].title
//                                             .toString(),
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Flexible(
//                                         child: Text(
//                                           "Event Description :",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                       Flexible(
//                                         child: Text(
//                                           controller.allEvent[index].description
//                                               .toString(),
//                                           // controller.allEvent[index].description,
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Flexible(
//                                         child: Text(
//                                           "Required Volunteers :",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                       Text(
//                                         controller.allEvent[index].members
//                                             .toString(),
//                                         // controller.allEvent[index].members.toString(),
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Flexible(
//                                         child: Text(
//                                           "Event Date :",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                       Text(
//                                         controller.allEvent[index].eventDate
//                                             .toString()
//                                             .substring(0, 10),
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Expanded(
//                                           flex: 1,
//                                           child: Image.network(
//                                               // model.image.toString(),
//                                               controller.allEvent[index].image
//                                                   .toString(),
//                                               fit: BoxFit.fill)),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }

import 'package:eandv/controller/event_controller.dart';
import 'package:eandv/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewEventDetails extends StatefulWidget {
  const ViewEventDetails({super.key});

  @override
  State<ViewEventDetails> createState() => _ViewEventDetailsState();
}

class _ViewEventDetailsState extends State<ViewEventDetails> {
  final EventController controller = Get.put(EventController());
  EventModel model = EventModel();

  @override
  Widget build(BuildContext context) {
    final title = 'Test Demo Sliver ';
    controller.getEvent();
    print(model.image);

    return MaterialApp(
      home: Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Image.network(model.image.toString(), fit: BoxFit.fill),

              centerTitle: true,
              title: Text("$title",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ) //TextStyle
                  ), //Text
            ), //FlexibleSpaceBar
            expandedHeight: 200,
            backgroundColor: Colors.pinkAccent[400],
            leading: IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () {},
            ), //IconButton
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                tooltip: 'Notification Icon',
                onPressed: () {},
              ), //IconButton
              IconButton(
                icon: Icon(Icons.shopping_cart),
                tooltip: 'Cart Icon',
                onPressed: () {},
              ), //IconButton
            ], //<Widget>[]
          ), //SliverAppBar
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
                title: Center(
                  child: Text('$index',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.greenAccent[400]) //TextStyle
                      ), //Text
                ), //Center
              ), //ListTile
              childCount: 4,
            ), //SliverChildBuildDelegate
          ) //SliverList
        ], //<Widget>[]
      ) //CustonScrollView
          ), //Scaffold
      debugShowCheckedModeBanner: false,
      // Remove debug banner for proper
      // view of setting icon
    ); //MaterialApp
  }
}
