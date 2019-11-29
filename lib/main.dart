import 'package:flutter/material.dart';
import 'package:cdemo/pages/home.dart';
import 'package:cdemo/pages/location.dart';
import 'package:cdemo/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Location(),
  },
));




