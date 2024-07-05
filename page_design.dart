import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/other_information.dart';
import 'package:weather/screate.dart';
import 'package:weather/weather_forecast.dart';
import 'package:http/http.dart' as http;
class Designpage extends StatefulWidget {
 
  const Designpage({
    super.key,
  });

  @override
  State<Designpage> createState() => _DesignpageState();
}

class _DesignpageState extends State<Designpage> {
  
  
 

  Future<Map<String,dynamic>> weather () async{
    try{
    
    const String place= "London";
    final res=await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$place&APPID=$apiid'));
    final data=jsonDecode(res.body);
    if(int.parse(data['cod'])!=200){
      throw 'an expected error';
   
    }

         //data['list'][0]['main']['temp'];
        
 
    return data;
    }catch(e){
      throw e.toString();
    }
   

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(appBar:
       AppBar(
        title:const Text( "Weather app",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
            
            ),
            ),
            actions: [IconButton(
              onPressed:(){
                setState(() {
                  
                });
              },
               icon:const Icon(Icons.refresh)
               )
               ],
               ),
    body:    FutureBuilder(
      future: weather(),
      builder: (context,snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );        }
        if(snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        final data=snapshot.data!;
        final currentdata= data['list'][0];
        final currenttem=currentdata['main']['temp'];
        final currentsky=currentdata['weather'][0]['main'];
        final currentpressure=currentdata['main']['pressure'];
        final currentspeed=currentdata['wind']['speed'];
        final currenthumdity=currentdata['main']['humidity'];

        return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
      children: [
         const SizedBox(height: 8),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter:ImageFilter.blur(sigmaX: 10,sigmaY: 10) ,
              child: Container(
                
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    
                    
                    children: [
                       Text('$currenttem',style:const TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                       const SizedBox(height: 20,),
                      Icon( currentsky=='Clouds'||currentsky=='Rain'?Icons.cloud: Icons.sunny,size: 68,),
                       const SizedBox(height: 15,),
                      Text(currentsky,style: const TextStyle(fontSize: 20),)
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        
        const  SizedBox(height: 8),
       const Align(
        alignment: Alignment.topLeft,
        child:   Text("Weather Forecast",style:  TextStyle(fontSize: 24,fontWeight:FontWeight.bold ),)),
       
           
            SizedBox(
              height: 120,
              
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                
                itemCount: 5,
                itemBuilder:(context,index)
              {
                final hourlyforecast=data['list'][index+1];
                final hourlysky=data['list'][index+1]['weather'][0]['main'];
                final time=DateTime.parse(data['list'][index+1]['dt_txt']);
                return weatherfore(icon: hourlysky=='Clouds'||hourlysky=='Rain' ? Icons.cloud:Icons.sunny
                , temperature: hourlyforecast['main']['temp'].toString()
                , time: DateFormat.Hm().format(time));
              }),
            ),
            
             
              
      const  SizedBox(height: 8),
       const Align(
          alignment: Alignment.topLeft,
          child: Text("Other information",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 110,),
            Otherinfor(
              value: currenthumdity.toString(),
              icon: Icons.water_drop,
              condition:"Humidity" ,
            ),
           Otherinfor(
            value: currentspeed.toString(),
              icon: Icons.air,
              condition:"Wind Speed" ,
           ),
           Otherinfor(
            value: currentpressure.toString(),
              icon: Icons.beach_access,
              condition:"Pressure" ,
           ),
          ],
        )
      ],
        
        ),
      );
      },
    )
    
      
       
      
        
        
      
        
      )
      );
  }
}