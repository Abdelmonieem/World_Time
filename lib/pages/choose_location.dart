
import 'package:flutter/material.dart';
import 'package:myapp3/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List <WorldTime> locations = [
    WorldTime(url: 'Europe/London',flag: 'gb.png',location: 'London'),
    WorldTime(url: 'Africa/Cairo',flag: 'eg.png',location: 'Cairo'),
    WorldTime(url: 'Europe/Berlin',flag: 'de.png',location: 'Berlin'),
    WorldTime(url: 'Africa/Algiers',flag: 'dz.png',location: 'Algiers'),
    WorldTime(url: 'Europe/Brussels',flag: 'be.png',location: 'Brussels'),
    WorldTime(url: 'America/New_York',flag: 'us.png',location: 'New York'),
    WorldTime(url: 'America/Argentina/Buenos_Aires',flag: 'ar.png',location: 'Argentina'),
    WorldTime(url: 'Asia/Bangkok',flag: 'th.png',location: 'Bangkok'),
    WorldTime(url: 'Asia/Riyadh',flag: 'sa.png',location: 'Riyadh'),
    WorldTime(url: 'Asia/Gaza',flag: 'ps.png',location: 'Palestine'),
    WorldTime(url: 'Asia/Seoul',flag: 'kr.png',location: 'Seoul'),
    WorldTime(url: 'Asia/Tokyo',flag: 'jp.png',location: 'Tokyo'),
    WorldTime(url: 'Asia/Dubai',flag: 'ae.png',location: 'Dubai'),

  ];

  Future<void> updatTime(int index) async {
    WorldTime worldTime = locations[index];

    await worldTime.getData();

    Navigator.pop(context,{
      'time':worldTime.time,
      'location':worldTime.location,
      'flag':worldTime.flag,
      'isDayTime':worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: const Text(
          'choose location',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (
            BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 8.0),
            child: Card(
              child: ListTile(
                onTap: (){

                  updatTime(index);

                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${locations[index].flag}',),
                  // radius: 150.0,
                ),
              ),
            ),
          );
        },
      )
    );
  }

}
