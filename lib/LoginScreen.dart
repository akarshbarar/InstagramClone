import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: 50.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "Instagram"
            ),
            SizedBox(
              height: 25.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Email",
                labelText: "Enter Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            GestureDetector(
                child: Container(
                color: Colors.grey,
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child:Center(
                  child: Text("Login"),
                ) ,
              ),
              onTap: (){
                
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/register");
              },
              child: Text("Create a Account"),
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/home");
              },
              child: Text("Skip"),
            ),
          ],
        ),
      ),
    );
  }
}