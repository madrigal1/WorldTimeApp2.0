import 'package:flutter/material.dart';
import 'package:cdemo/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}


class _LocationState extends State<Location> {


  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
           'location': instance.location,
            'timeDisplay': instance.timeDisplay,
             'time': instance.time,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
            'Choose Location',
            style: TextStyle(
              color:Colors.white,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body:ListView.builder(itemCount: locations.length,
          itemBuilder:(context, index) {
                return Card(
                  child: ListTile(
                    onTap:() {
                      updateTime(index);
                    },
                    title:Text(
                      locations[index].location,
                    ),
                  ),
                );
          }
      ),
    );
  }
}
