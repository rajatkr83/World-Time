import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the ui
  String time; //time at that location
  String flag; //url asset for the flag icon
  String url; //location url end point
  bool isDaytime; // true or false depends on daytime or not

  WorldTime({this.location, this.flag, this.url});

  String getMessage() {
    return "An error has been occurred";
  }

  Future<void> getTime() async {
    try {
      //requesting Response
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = await jsonDecode(response.body);
      print(data);

      //getting properties from data
      String dateTime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);

      print('$offset:$offsetMin');
      print(dateTime);

      //creating dateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(
          Duration(hours: int.parse(offset), minutes: int.parse(offsetMin)));

      isDaytime = now.hour > 4 && now.hour < 19 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error: $e");
      time = "Failed to Load";
      isDaytime = e.getMessage();
    }
  }
}
