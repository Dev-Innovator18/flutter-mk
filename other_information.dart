import 'package:flutter/material.dart';
class Otherinfor extends StatelessWidget {
    final IconData icon;
  final String condition;
  final String value;

  const Otherinfor({
    
    super.key,
    required this.icon,
    required this.condition,
    required this.value

  });

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 0,
          
            
            child: Column(
              children: [
                
                 const SizedBox(height: 5,),
                Icon(icon,size: 32,),
                 const SizedBox(height: 5,),
                Text(condition),
               const SizedBox(height: 5,),
                Text(value),
                 const SizedBox(height: 5,),
            
              ],
            ),
          );
        
  }
}