import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Map data = {};

  @override
  Widget build(BuildContext context) {
    data =ModalRoute.of(context).settings.arguments;
    return Scaffold(
         body: SafeArea(
           child: Padding(
             padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
             child: Column(
               children: <Widget>[
                      Expanded(
                        flex:1,
                        child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: <Widget>[
                            ButtonTheme(
                              minWidth: 40.0,
                              height:40.0,
                              child: RaisedButton(
                                 onPressed:(){},
                                 color: Colors.purple[400],
                                 elevation: 2.0,
                                 shape: new CircleBorder(),
                                 child: Text(
                                   '+',
                                   style: TextStyle(
                                     fontSize:20.0,
                                     color:Colors.white,
                                   ),
                                 ),
                               ),
                            ),
                           SizedBox(width:270.0),
                           ButtonTheme(
                             minWidth: 50.0,
                             height:50.0,
                             child: RaisedButton(
                               onPressed: (){
                                 Navigator.pushNamed(context, '/location');
                               },
                               color: Colors.white,
                               elevation: 2.0,
                               shape: new CircleBorder(),
                               child: Icon(
                                 Icons.edit,
                                 color:Colors.purple[400],
                               ),
                             ),
                           ),
                         ],
                     ),
                      ),
                    Expanded(
                      flex:6,
                       child: AnalogClock(
                         decoration: BoxDecoration(
                             border: Border.all(width: 2.0, color: Colors.black),
                             color: Colors.transparent,
                             shape: BoxShape.circle),
                         width: 150.0,
                         isLive: true,
                         hourHandColor: Colors.black,
                         minuteHandColor: Colors.black,
                         showSecondHand: false,
                         numberColor: Colors.black87,
                         showNumbers: true,
                         textScaleFactor: 1.4,
                         showTicks: false,
                         showDigitalClock: false,
                         datetime: data['time'],
                       ),
                     ),
                     Expanded(
                       flex:4,
                       child: Text(
                           data["location"],
                           style: TextStyle(
                             fontSize: 15.0,
                           ),
                       ),

                     ),
                     Expanded(
                       flex: 4,
                       child: Text(
                           data['timeDisplay'],
                            style: TextStyle(
                              fontSize:50.0,

                            ),
                       ),
                     ),
               ],
             ),
           ),
         ),
    );
  }
}
