import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utilities/constants.dart';

import '../widgets/gradient_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  TextFormField _buildEmailAddressField(){
    return TextFormField(
      onSaved: (String value){

      },
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: kActiveTabBarIconColor
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        suffixIcon: Icon(Icons.alternate_email, color: Colors.white)
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField _buildPasswordField(){
    return TextFormField(
      onSaved: (String value){

      },
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: kActiveTabBarIconColor
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        suffixIcon: Icon(Icons.lock, color: Colors.white)
      ),
      keyboardType: TextInputType.text,
      obscureText: true
    );
  }

  Expanded backButton(){
    return Expanded(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=> Navigator.pop(context)
          )
        ],
      )
    );
  }

  Expanded introText(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text('Welcome back', style: kIntroTitleTextStyle)
                ),
                Expanded(
                  child: Container()
                )
              ]
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text('Login to your account', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500))
                ),
                Expanded(
                  child: Container()
                )
              ]
            ),
          ],
        ),
      )
    );
  }

  Expanded loginForm(){
    return Expanded(
      flex: 3,
      child: Form(
        key: _loginFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              _buildEmailAddressField(),
              SizedBox(height: 10.0),
              _buildPasswordField(),
              SizedBox(height: 30.0),
              GradientButton(text: 'Login', onPressed: ()=> Navigator.pushNamed(context, '/home')),
              SizedBox(height: 50.0),
              Text('Forgot your password?')
            ]
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: kLoginPageBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              backButton(),
              introText(),
              loginForm()
            ]
          ),
        )
      )
    );
  }
}