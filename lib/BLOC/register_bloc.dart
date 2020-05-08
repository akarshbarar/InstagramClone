import "dart:async";
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:instagramcloneflutter/VALIDATOR/register_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class Dispose{
  void dispose();
}

class RegisterBloc extends Object with RValidator implements Dispose{
  
  final _emailController=BehaviorSubject<String>();
  final _passwordController=BehaviorSubject<String>();

 FirebaseAuth mauth=FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.reference().child('users');
  
  Function(String) get emailChanged=>_emailController.sink.add;
  Function(String) get passwordChanged=>_passwordController.sink.add;

  Stream<String> get email=>_emailController.stream.transform(emailValidator);
  Stream<String> get pass=>_passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitCheck=>Observable.combineLatest2(email, pass, (e,p)=>true);

 
  

  submit(BuildContext context){
      print("BUTTON CLICKED");
      print(_emailController.value);
      print(_passwordController.value);
      return registerUser(context,_emailController.value, _passwordController.value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController?.close();//Not Null
    _passwordController?.close();
  }
  
}

FirebaseAuth mauth=FirebaseAuth.instance;
final ref=FirebaseDatabase.instance.reference().child('users');

registerUser(BuildContext context,String email, String password) async {
    
    mauth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then(
        (AuthResult auth)
        {
          
           Navigator.of(context).pushNamed('/home');   
        }
    );


}