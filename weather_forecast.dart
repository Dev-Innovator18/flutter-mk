import 'package:flutter/material.dart';
class weatherfore extends StatelessWidget {
  final IconData icon;
  final String temperature;
  final String time;
  const weatherfore({
    super.key,
    required this.icon,
    required this.temperature,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Card(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Container(
              width: 80,
              
              
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                    
                     children: [
                              Text(time),
                              const SizedBox(height: 10,),
                              Icon(icon),
                               const SizedBox(height: 10,),
                              Text(temperature),
                
                     ],
                
                ),
              ),
            ),
        
        
        
           );
  }
}