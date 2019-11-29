import 'package:flutter/material.dart';
import 'package:cdemo/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
      WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url:'Europe/Berlin');
      await instance.getTime();
   Future.delayed(Duration(seconds:3),() {
     Navigator.pushReplacementNamed(context, '/home',arguments: {
       'timeDisplay' : instance.timeDisplay,
       'time': instance.time,
       'location': instance.location,
       'flag': instance.flag,
     });
   });
  }


  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body:SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height:350.0),
              Center(
                child: SpinKitRotatingCircle(
                color: Colors.white,
                  size: 50.0,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
