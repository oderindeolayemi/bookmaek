import 'package:flutter/material.dart';

import '../utilities/constants.dart';

import '../widgets/gradient_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  TextFormField _buildUsernameField(){
    return TextFormField(
      onSaved: (String value){

      },
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        hintText: 'Username',
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
        suffixIcon: Icon(Icons.person, color: Colors.white)
      ),
      keyboardType: TextInputType.text,
    );
  }

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
  
  TextFormField _buildPhoneNumberField(){
    return TextFormField(
      onSaved: (String value){

      },
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        hintText: 'Phone',
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
        suffixIcon: Icon(Icons.phone, color: Colors.white)
      ),
      keyboardType: TextInputType.phone,
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
        child: Text('Create an account', style: kIntroTitleTextStyle)
      )
    );
  }

  Expanded signUpForm(){
    return Expanded(
      flex: 3,
      child: Form(
        key: _signUpFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              _buildUsernameField(),
              SizedBox(height: 10.0),
              _buildEmailAddressField(),
              SizedBox(height: 10.0),
              _buildPhoneNumberField(),
              SizedBox(height: 10.0),
              _buildPasswordField(),
              SizedBox(height: 30.0),
              GradientButton(text: 'Register', onPressed: (){})
            ]
          )
        )
      )
    );
  }

  Container termsAndConditions(){
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text('By clicking Sign up, you agee to the following Terms and Conditions without reservation.', textAlign: TextAlign.center,)
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
              signUpForm(),
              termsAndConditions()
            ]
          ),
        )
      )
    );
  }
}