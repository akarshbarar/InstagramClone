import 'package:flutter/material.dart';
import 'package:instagramcloneflutter/BLOC/register_bloc.dart';
class RegsiterPage extends StatefulWidget {
  @override
  _RegsiterPageState createState() => _RegsiterPageState();
}

class _RegsiterPageState extends State<RegsiterPage> {

  final bloc=RegisterBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder:(context,snapshot)=> TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    hintText: "Enter Email",
                    errorText: snapshot.error

                  ),
                  onChanged: bloc.emailChanged,
                ),
              ),
              StreamBuilder<String>(
                stream: bloc.pass,
                builder:(context,snapshot)=> TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    hintText: "Enter password",
                    errorText: snapshot.error
                  ),
                  obscureText: true,
                  onChanged: bloc.passwordChanged,
                ),
              ),
              StreamBuilder<bool>(
                stream: bloc.submitCheck,
                builder:(context,snapshot)=> 
                RaisedButton(
                  onPressed: (){
                    if(!snapshot.hasData){
                      return null;
                    }
                    else{
                     
                       
                      return bloc.submit(context);
                    }
                  },
                  child: Text("Register"),
                ),
              ),
              FlatButton(
                child: Text("Already have account"),
                onPressed: (){
                  Navigator.of(context).pushNamed('/register');
                },
              ),
            ],
          ),

      ),
    );
  }
}