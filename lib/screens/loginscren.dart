// ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously

import 'dart:js';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taxiback/screens/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import the FirebaseDatabase package.
import 'package:overlay_toast_message/overlay_toast_message.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 35.0),
            Image(
              image: AssetImage("assets/car_ios.png"),
              width: 120.0,
              height: 120.0,
              alignment: Alignment.center,
            ),
            SizedBox(height: 1.0),
            Text(
              "Logueate por favor",
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 1.0),
                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Correo",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.amber,
                        fontSize: 10.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 1.0),
                  TextField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.amber,
                        fontSize: 10.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    onPressed: () {

                      if(!emailTextEditingController.text.contains("@")){
                        OverlayToastMessage.show(
                                        context,
                                      textMessage: "Ingrese por favor un formato valido de correo electornico",
                                      );

                      }else if(passwordTextEditingController.text.isEmpty){
                        OverlayToastMessage.show(
                                        context,
                                      textMessage: "La contraseña es obligatoria",
                                      );
                      }else{
                        loginAndAuthenticationUser(context);

                      }
                    },
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text("¿No tienes cuenta?. Crea una")),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticationUser(BuildContext context) async {
    
    try{
      final UserCredential firebaseUser = await _firebaseAuth
          .signInWithEmailAndPassword(
              email: emailTextEditingController.text,
              password: passwordTextEditingController.text)
              .catchError((ErrMsg){
                 OverlayToastMessage.show(
                  context,
                  textMessage: 'Un erro mano mira '+ ErrMsg,
                 );
              });
              if (firebaseUser != null) {
  
              Navigator.pushAndRemoveUntil(
                context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                        (Route<dynamic> route) => false,
              );

                // Show a toast message indicating successful login
                OverlayToastMessage.show(
                    context,
                   textMessage: 'Logueado',
                   );
                    }else{
                      _firebaseAuth.signOut();
                      OverlayToastMessage.show(
                                        context,
                                      textMessage: "Contraseña o correo inexistente o incorrecto",
                                      );
                    }
                  }catch(e){
                    print(e);
                  }

                
                  


     
   
  }
 


}
