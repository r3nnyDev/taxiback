// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiback/allwidget/Divider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
 

class MainScreen extends StatefulWidget{
      static  String idScreen = "mainscreen";
     


  @override

  _MainScreenState createState() => _MainScreenState();

}


 

 

 

class  _MainScreenState extends State<MainScreen>{
   final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();
       late GoogleMapController newgoogleMapController;
        GlobalKey<ScaffoldState> scaffoldkey  = new  GlobalKey<ScaffoldState>();
         late Position curretPosition;
        var geolocator = Geolocator();

        void locatePosition()async {
            Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
            curretPosition = position;

            LatLng latLngPosition = new LatLng(position.latitude, position.longitude);

            CameraPosition camaraPosition = new CameraPosition(target:latLngPosition, zoom: 14);
            newgoogleMapController.animateCamera(
              CameraUpdate.newCameraPosition(camaraPosition)
              
            );

        }


  @override

  Widget build(BuildContext context){

    return Scaffold(
      key: scaffoldkey,

      appBar: AppBar(

        title: const  Text("Pagina Principal"),

      ),
      drawer: Container(
        color: Colors.black,
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              Container(
  height: 165.0,
  child: DrawerHeader(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Row(
      children: [
        Image.asset("assets/icono.png", height: 60, width: 60,), // Ajusta el tamaño de la imagen según tus necesidades.
        SizedBox(width: 16.0,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda.
            children: [
              Text(
                "Nombre de perfil",
                style: GoogleFonts.acme(fontSize: 24.0),
              ),
              SizedBox(height: 6.0,),
              Text("Visitar perfil"),
            ],
          ),
        ),
      ],
    ),
  ),
),
              Divider(),

              SizedBox(height: 12.0,),
              ListTile(
                leading: Icon(Icons.history),
                  title:  Text(
                          "Historico",
                          style: GoogleFonts.acme(fontSize: 15.0),   
                          ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Visitar perfil"),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Informacion"),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            myLocationButtonEnabled: true, 
            
             initialCameraPosition: CameraPosition(
              target: LatLng(-32.083455, -20.092926),
              zoom: 100.0,
              
               // Puedes ajustar el nivel de zoom según tus necesidades
            ),
            onMapCreated: (GoogleMapController controller){
              _controllerGoogleMap.complete(controller);
              newgoogleMapController = controller;
              locatePosition();

            }, 

            

          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 245.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.0,spreadRadius: 0.5,offset: Offset(0.7, 0.7)
                  )
                ]
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6.0,),
                    Text(
                      "Hola", style: GoogleFonts.acme(fontSize: 12.0),
                     
                    ),
                    Text(
                      " Buenas",style: GoogleFonts.acme(fontSize: 20.0),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 0.541),
                    blurRadius: 6.0,spreadRadius: 0.5,offset: Offset(0.7, 0.7)
                  )
                ]
              ),

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.blueAccent,),
                    SizedBox(width: 10.0,),
                    Text("Busca lugar de salida",
                        style: GoogleFonts.acme(fontSize: 20.0)
                  )
                  ],
              
                ),
              ),
                    ),
                    SizedBox(width: 24.0,),
                    Row(
                      children: [
                        Icon(Icons.home, color:Colors.grey,),
                        SizedBox(width: 12.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add home",

                            ),
                            SizedBox(height: 4.0,),
                            Text(
                              "you living home adress",  style: GoogleFonts.acme(fontSize: 12.0, color: Colors.grey)

                            )

                          ],
                        )

                      ],
                    ),
                    SizedBox(width: 24.0,),
                    Row(
                      children: [
                        Icon(Icons.work, color:Colors.grey,),
                        SizedBox(width: 12.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add work",

                            ),
                            SizedBox(height: 4.0,),
                            Text(
                              "you living work adress",  style: GoogleFonts.acme(fontSize: 12.0, color: Colors.grey)

                            )

                          ],
                        )

                      ],
                    ),
                     


                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top:45.0,
            left: 22.0,

          child: GestureDetector(
            onTap: (){
              scaffoldkey.currentState?.openDrawer();

            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.0),
                boxShadow: [
               BoxShadow(
                color: Colors.black,
                blurRadius: 6.0,
                spreadRadius: 0.5,
                offset: Offset(0.7, 0.7),
                  ),
                  ],
          
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                
                child: Icon(Icons.menu, color: Colors.black,),
          
              ),
          
            ),
          )
          ),
        ],
      ),

    );

  }
  
 
   

}
