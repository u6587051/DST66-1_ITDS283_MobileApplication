import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
/// Constructs a [ HomeScreen ]
const HomeScreen ({ super . key }) ;
@override
Widget build ( BuildContext context ) {
return Scaffold (
appBar : AppBar ( title : const Text ('Home Screen') ) ,
body : Center (
  child : ElevatedButton(
  onPressed : () => (), child: Text('Home'),
// ToDo #4
// go to deail page test on named_router and withoutnamed,
) ,
) ,
) ;
}
}