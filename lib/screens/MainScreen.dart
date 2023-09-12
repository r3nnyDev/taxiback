import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

 

class MainScreen extends StatefulWidget{
      static  String idScreen = "mainscreen";


  @override

  _MainScreenState createState() => _MainScreenState();

}


 

 

 

class  _MainScreenState extends State<MainScreen>{

  @override

  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(

        title: const  Text("Pagina Principal"),

      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true, 
            
             initialCameraPosition: CameraPosition(
              target: LatLng(37.43296265331129, -122.08832357078792),
              zoom: 14.0, // Puedes ajustar el nivel de zoom según tus necesidades
            ), 

            

          )
        ],
      ),

    );

  }
  
 
   

}
