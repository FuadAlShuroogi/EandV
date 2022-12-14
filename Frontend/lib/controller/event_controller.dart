import 'dart:convert';
import 'package:eandv/model/event_model.dart';
import 'package:eandv/screens/Organizer/organizer_home_screen.dart';
import 'package:eandv/screens/Volunteer/viewevent_screen.dart';
import 'package:eandv/screens/Welcome/welcome_screen.dart';
import 'package:eandv/screens/profile.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:eandv/utilities/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_model.dart';
import '../screens/Volunteer/volunteer_home_screen.dart';

class EventController extends GetxController {
  static const apiBaseUrl = 'http://localhost:3000/';

  List<EventModel> allEvent = [];
  List<Login_model> LoginDetails = [];

  Future<void> addEvent(Map eventData) async {
    final EventController controller = Get.put(EventController());

    var url = Uri.parse('${apiBaseUrl}organizer/addevent');
    try {
      final response = await http.post(url, body: eventData);
      if (response.statusCode == 200) {
        toast("Event added successfully ✅");
        controller.saveEvent(response.body);
        Get.back();
      } else {
        toastError(response.body);
      }
    } catch (error) {
      toastError(error.toString());
    }
  }

  Future<void> editEvent(Map editEventData) async {
    var url = Uri.parse('${apiBaseUrl}organizer/editevent');
    try {
      final response = await http.post(url, body: editEventData);

      if (response.statusCode == 200) {
        toast("Event updated successfully ✅");
        Get.to(ViewEventScreen());
      } else {
        toastError(response.body);
      }
    } catch (error) {
      toastError(error.toString());
    }
  }

  Future<void> editUser(Map editUserData) async {
    var url = Uri.parse('${apiBaseUrl}users/editUser');
    try {
      final response = await http.post(url, body: editUserData);

      if (response.statusCode == 200) {
        SharedPreferences shared_User = await SharedPreferences.getInstance();
        Login_model _auth = Login_model.fromJson(jsonDecode(response.body));
        String login = jsonEncode(_auth);
        shared_User.setString('login', login);
        toast("User updated successfully ✅");
        Get.to(const Profile());
      } else {
        toastError(response.body);
      }
    } catch (error) {
      toastError(error.toString());
    }
  }

  Future<void> deleteEvent(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('${apiBaseUrl}organizer/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        toast("Event deleted successfully ❌");
        Get.to(ViewEventScreen());
      } else {
        toastError(response.body);
      }
    } catch (error) {
      toastError(error.toString());
    }
  }

  // Future<void> savelogiin(var response) async {
  //   SharedPreferences shared_User = await SharedPreferences.getInstance();
  // }

  Future<void> saveLogin(var response) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    Login_model _auth = Login_model.fromJson(jsonDecode(response));
    String login = jsonEncode(_auth);
    shared_User.setString('login', login);
  }

  Future<Login_model> getLogin() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    // print(shared_User);
    String? login = shared_User.getString('login');
    if (login == '') {
      print("User not logged In");
      return Login_model();
    }
    var user = Login_model.fromJson(jsonDecode(login!));
    print(user.cpr);
    return user;
  }

  Future<void> LogOut() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    String login = '';
    print(login);
    shared_User.setString('login', login);
  }

  Future<void> addUser(Map userData) async {
    // print("add event data $eventData");

    var url = Uri.parse('${apiBaseUrl}users/addUser');

    try {
      final response = await http.post(url, body: userData);
      if (response.statusCode == 200) {
        toast("User added successfully ✅");

        Get.to(const WelcomeScreen());
      } else {
        toastError(response.body);
      }
    } catch (error) {
      toastError(error.toString());
      // print(error);
    }
  }

  Future<void> loginUser(Map userData) async {
    // print("add event data $eventData");
    final EventController controller = Get.put(EventController());
    var url = Uri.parse('${apiBaseUrl}users/loginUser');

    try {
      final response = await http.post(url, body: userData);

      if (response.statusCode == 200) {
        toast("You've successfully logged in ✅");
        var jsonResponse = jsonDecode(response.body);
        // print(response.body);
        // Login_model.fromJson(jsonDecode(response.body));
        controller.saveLogin(response.body);

        if (jsonResponse['role'] == "Organizer") {
          Get.to(OrganizerHomeScreen());
        } else {
          Get.to(VolunteerHomeScreen());
        }
      } else {
        toastError(response.body);
      }
    } catch (error) {
      toastError(error.toString());
    }
  }

  getUser() async {
    LoginDetails = [];
    var url = Uri.parse('${apiBaseUrl}users/getUser');
    List<Login_model> helperList = [];
    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        // print(response.body);
      }
      LoginDetails.addAll(helperList);
      update();
    } catch (error) {
      toastError(error.toString());
    }
  }

  getEvent() async {
    allEvent = [];
    var url = Uri.parse('${apiBaseUrl}organizer/getEvent');
    List<EventModel> helperList = [];
    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        helperList.addAll(List<EventModel>.from(
            json.decode(response.body).map((x) => EventModel.fromJson(x))));
      }
      allEvent.addAll(helperList);
      update();
    } catch (error) {
      toastError(error.toString());
    }
  }

  Future<void> saveEvent(var eventData) async {
    SharedPreferences shared_Event = await SharedPreferences.getInstance();
    EventModel eventd = EventModel.fromJson(jsonDecode(eventData));
    String event = jsonEncode(eventd);
    print(event);
    shared_Event.setString('event', event);
  }

  Future<EventModel> getEvents() async {
    SharedPreferences shared_Event = await SharedPreferences.getInstance();
    // print("201");
    // print(shared_Event);
    String? event = shared_Event.getString('event');
    print("204");
    print(event);
    // if (login == '') {
    //   print("User not logged In");
    //   return Login_model();
    // }
    var events = EventModel.fromJson(jsonDecode(event!));
    print(events.eventDate);
    return events;
  }
}
