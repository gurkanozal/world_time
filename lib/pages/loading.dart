import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async {
    WorldTime instance = new WorldTime(flag: 'germany.png', location: 'Berlin', url: '/Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time':instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
