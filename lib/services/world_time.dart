import 'package:http/http.dart';
import'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? time;
  String? location ;
  String? flag;
  String? url ;
  bool? isDayTime ;
  WorldTime({this.location,this.flag,this.url});
  Future<void> getTime() async{
try{
  //make the request from the world time api
  Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
  Map data=jsonDecode(response.body);
  //print(data);
  //get proprieties from data
  String datetime=data['datetime'];
  String offset=data['utc_offset'].substring(1,3);
  //print(datetime);
  //print(offset);
  //convert datetime to a class
  DateTime now=DateTime.parse(datetime);
  now=now.add(Duration(hours:int.parse(offset) ));
  isDayTime=now.hour>6 && now.hour<19?true:false;
  time=DateFormat.jm().format(now);

}
catch(e){
  time='no time to display';
  print ('caught error :$e');
}




  }

}

