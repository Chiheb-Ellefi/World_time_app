import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
    String? time;

  void setupWorldTime() async{
    WorldTime wt=WorldTime(flag: 'TN',url: 'Africa/Tunis',location: 'Tunis,Tunisia');
    await wt.getTime();
    setState(() {
      time=wt.time;
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'flag':wt.flag,
        'url':wt.url,
        'location':wt.location,
        'time':wt.time,
        'isDayTime':wt.isDayTime,
      });
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

final spinkit = SpinKitFadingCube(
  color: Colors.blueAccent.shade700,
  size: 50.0,
);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
        child: spinkit,
      )
    );
  }
}
