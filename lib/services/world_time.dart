import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  late String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      var response = await http.get(uri);
      Map data = convert.jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'could not get time data';
    }
  }
}
