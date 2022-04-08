
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String url;
  String time='';
  String flag= '';
  String location='';
  bool isDayTime= true;//which tell us if it's day or night

  WorldTime({required this.url,required this.flag,required this.location});
  Future<void> getData() async{


    try{
      //getting json file and store it in response which describe the jsonfile
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      // inverting the json file to Map
      Map data = jsonDecode(response.body);
      //getting the date time and offset from the map
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //converting the time type from String to Datetime to add the offset
      DateTime now = DateTime.parse(datetime);
      //adding offset to the time
      now = now.add(Duration(hours: int.parse(offset)));

      //check if it's daylight or moonlight
      isDayTime = now.hour>6 && now.hour<18 ? true : false ;
      //converting the time into String to view it to the screen
      time = DateFormat.jm().format(now).toString();
      // print(time);
    }catch(e){
      time="Network Error";
    }




  }

}
