
import 'package:flutter/material.dart';

class Materialstatepage extends StatefulWidget{
  const Materialstatepage({super.key});
  @override
  State<Materialstatepage>createState()=>_Materiala();
   
  
}
final  TextEditingController textEditingController=TextEditingController();
  class _Materiala extends State<Materialstatepage>{
    double result = 0.0;
    @override
   Widget build(BuildContext context){
    
    
    const border=  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular((4.0))),
              borderSide: BorderSide
              (style: BorderStyle.solid,
              width: 2.0,
              strokeAlign: BorderSide.strokeAlignOutside
              ))
;
    return     MaterialApp(
     home: Scaffold(
      appBar: AppBar(title: const Text("currency converter"),),
      backgroundColor:  Colors.white,
      body:  ColoredBox
      (color: Colors.blue
      ,child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Text('INR value is ${result!=0 ? result.toStringAsFixed(2) : 0}',
),
          Padding(
             padding: const  EdgeInsets.all(10.0),
            child: TextField(
              controller: textEditingController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
             
              decoration: const InputDecoration(hintText: "enter the amount in dollar",
              hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),
              fillColor: Colors.white,
              filled: true ,
              prefix: Icon( Icons.monetization_on,color: Colors.black),
              focusedBorder: border,
              enabledBorder: border
              )
            ),
            
          ),
         TextButton(onPressed: (){
         
          result=double.parse(textEditingController.text)*83.55;
          setState(() {
           
             
          });
        
       
      
      
         } ,
          style: TextButton.styleFrom(backgroundColor: Colors.black,),       
      
          child:  const Text("converter")
          ) 
          ]
          ,)
            ,)
    )
    );
  }
  
  }




