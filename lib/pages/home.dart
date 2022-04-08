import 'package:flutter/material.dart';


class Home extends StatefulWidget {
 const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();


}

class _HomeState extends State<Home> {
  Map data = {};
  late String time;
  @override
  Widget build(BuildContext context) {

    //Receiving data and time from the loading screen as a Map
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
   time = data['time'];

   String bgImage = data['isDayTime']?'dayTime.jpg':'nightTime.jpg';
   Color? color = data['isDayTime']? Colors.black:Colors.white;
   Color? bgColor = data['isDayTime']? Colors.blue[900]:Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28.0,200.0,28.0,0),
            child: Column(
              children: [


                const SizedBox(height: 20.0,),

                Text(
                  data['location'],
                  style:
                  TextStyle(
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: color,
                  ),
                ),
                const SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    time,
                    style:
                    TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 55.0,
                      color: color,
                    ),
                  ),
                ],),
                const SizedBox(height: 50.0,),
                FlatButton.icon(
                  onPressed: () async {

                    dynamic result = await Navigator.pushNamed(context, '/location') ;

                    setState(()  {
                      data = result;

                    });

                  },
                  icon: Icon(
                    Icons.location_on,
                    color: color,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color:color,),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
