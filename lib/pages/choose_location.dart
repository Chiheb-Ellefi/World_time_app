import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> list=[
    WorldTime(flag: 'TN',url: 'Africa/Tunis',location: 'Tunis, Tunisia'),
    WorldTime(flag: 'DE',url: 'Europe/Berlin',location: 'Berlin, Germany'),
    WorldTime(flag: 'GB',url: 'Europe/London',location: 'London, United Kingdom'),
    WorldTime(flag: 'EG',url: 'Africa/Cairo',location: 'Egypt, Cairo'),
    WorldTime(flag: 'SG',url: 'Asia/Jakarta',location: 'Jakarta, Singapore'),
  ];

  void updateTime(index)async{
    WorldTime instance=list[index];
    await instance.getTime();
    Navigator.pop(context,{
      'flag':instance.flag,
      'url':instance.url,
      'location':instance.location,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount:list.length,
          itemBuilder:(context,index){
            return Padding(
              padding:const  EdgeInsets.symmetric(vertical:1.0 , horizontal:4.0 ),
              child: Card(
                child:ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text('${list[index].location}'),
                  leading: CircleAvatar(
                      backgroundImage:NetworkImage('https://flagsapi.com/${list[index].flag}/flat/64.png'),
                      radius: 30,
                      backgroundColor:Colors.transparent
                  ),

                ),
              ),
            );
    }
      ));
  }
}
