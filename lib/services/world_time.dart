import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
     String timeDisplay;
     DateTime time;
     String url;
     String flag;
     String location;

     WorldTime({this.location,this.flag,this.url});

     Future<void> getTime() async {

          try {
               Response res = await get('http://worldtimeapi.org/api/timezone/$url');
               Map data = json.decode(res.body);
               print(data);

               String datetime = data['datetime'];
               String offset = data['utc_offset'].substring(1,3);

               DateTime now  =  DateTime.parse(datetime);
               now = now.add(Duration(hours:int.parse(offset)));
               time =now;
               timeDisplay = DateFormat.jm().format(now);
          }catch(e) {
               timeDisplay ="api error";
               print('caugght error : $e');
          }
     }
}