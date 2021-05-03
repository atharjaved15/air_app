import 'package:air_app/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'adminLogin.dart';

class loginScreen extends StatelessWidget {

  loginScreen(){
    BuildContext context;
  }


  Color primaryColor = Colors.black87;
  Color secondaryColor = Colors.white;
  Color logoColor  =   Colors.redAccent;

  String email, password;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 10,
          toolbarHeight: 30.0,
          leadingWidth: MediaQuery.of(context).size.width,
        ),
        backgroundColor: primaryColor,
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildFooterLogo(),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Sign in to IDA and continue',
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter your email and password below to continue to the AIR!',
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.openSans(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTextField(nameController, Icons.account_circle, 'Username'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Password'),
                SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: (){},
                  color: logoColor,
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => registerScreen()));
                  },
                  color: Colors.green,
                  child: Text('Register',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> adminLogin())),
                  },
                  color: Colors.purple,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 10),
                      Text('Admin Panel',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 100),

              ],
            ),
          ),
        ));
  }
  _buildFooterLogo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            height: 100,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
  _buildTextField(TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black87),
            icon: Icon(
              icon,
              color: Colors.black87,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );


  }
  void _getEmail(){
    email = nameController.text.toString();
  }
  void _getPassword(){
    password = passwordController.text.toString();
  }

}