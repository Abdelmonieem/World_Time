
import 'package:flutter/material.dart';
import 'package:myapp3/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);



  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String timeString='loading';


  void setWorldTime() async {
    //taking object from WorldTime service and sending location,flag and url to get the time at this location
     WorldTime worldTime=  WorldTime(url: "Africa/Cairo", flag: 'eg.png', location: 'Cairo');

     //launch getData() Function which get the time from the Api and wait to get the time
     await worldTime.getData();
     //go to home screen with removing loading screen from the stack and send data and time to home screen
     Navigator.pushReplacementNamed(context, '/home',arguments: {
       'time':worldTime.time,
       'location':worldTime.location,
       'flag':worldTime.flag,
       'isDayTime':worldTime.isDayTime,
     });

    // setState(() {
    //   timeString = worldTime.time;
    //   print(timeString);
    //   timeString = timeString.substring(0,19);
    // });
  }



  @override
  void initState() {
    super.initState();
    setWorldTime();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                timeString,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white
              ),
            ),
     const SizedBox(height: 80.0,),
     const SpinKitFoldingCube(
          color: Colors.white,
          size: 90.0,
        ),

        ],),
      )
    );
  }
}
