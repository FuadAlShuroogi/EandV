import 'package:flutter/material.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:get/get.dart';

class ViewEventScreen extends StatelessWidget {
  ViewEventScreen({Key? key}) : super(key: key);

  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    controller.getEvent();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event List'),
      ),
      body: GetBuilder<EventController>(
        builder: (controller) => controller.allEvent.isEmpty
            ? const Center(
                child: Text('😔 NO DATA FOUND (: 😔'),
              )
            : ListView.builder(
                itemCount: controller.allEvent.length,
                itemBuilder: (context, index) {
                  print(index);
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Event Details"),
                          const SizedBox(
                            height: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Event Title :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allEvent[index].title,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Event Description :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allEvent[index].description,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Event Date :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.allEvent[index].eventDate,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}