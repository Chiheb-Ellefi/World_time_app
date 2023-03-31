import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage=data['isDayTime'] ? 'lib/assets/day.jpg' :'lib/assets/night.jpeg';
    Color bgColor =data['isDayTime'] ? Colors.blue.shade800 : Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ) ,
        ),
        child: Padding(
          padding:const EdgeInsets.fromLTRB(0, 120.0, 0, 0) ,
          child: Column(

            children: [
             ElevatedButton.icon(
                 onPressed: () async{
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data={
                       'time' :result['time'],
                       'flag' :result['flag'],
                       'location':result['location'],
                       'isDayTime':result['isDayTime']
                     };
                   });
                 },
                 icon:const Icon(Icons.edit_location),
                 label:const  Text('Edit location'),
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.transparent,
                 elevation: 0,
                 foregroundColor: Colors.grey.shade300,
               )
             ),
              const SizedBox(height: 20.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  CircleAvatar(
                      backgroundImage:NetworkImage('https://flagsapi.com/${data['flag']}/flat/64.png'),
                      radius: 15,
                      backgroundColor:Colors.transparent
                  ),

                  const SizedBox(width: 2.0),
                  Text(
                    data['location'],
                    style:   TextStyle(
                      fontSize: 28.0,
                      color: Colors.grey.shade300,
                      letterSpacing: 2.0,
                    ),
                  ),

                ]
              ),
              const SizedBox(height:20.0 ,),
              Text(
                data['time'],
                style:  TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 60.0,
                ),
              )
            ],
          ),
        ),
      )
      ),
    );
  }
}
