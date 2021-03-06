import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class adminLogin extends StatelessWidget {

  adminLogin(){
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
                  'Sign in to AIR and continue',
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(color: Colors.white, fontSize: 28,fontFamily: 'Georgia'),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter your email and password below to continue to the Interior Design Mobile Application as an Admin!',
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Georgia'),
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTextField(nameController, Icons.account_circle, 'Username'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Password'),
                SizedBox(height: 200),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () => admin(context),
                  color: logoColor,
                  child: Text('Login As Admin',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Georgia')),
                  textColor: Colors.white,
                ),

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
            height: 150,
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
  /*Future<void> signOutGoogle() async {
    Firebase.initializeApp();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    print("User Signed Out");
  }*/
  /* Future<void> registerUser(context) async{
    Firebase.initializeApp();
    _getEmail();
    _getPassword();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await database(uid: result.user.uid).updateUserData(email, password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => userPanel()));
    }
    catch(e){
      print(e.toString());
    }
    return null;
  }*/
  /* Future<void> signInWithGoogle() async {
    BuildContext context;
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //await Firebase.initializeApp();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      print('signInWithGoogle succeeded: $user');
      Navigator.push(context , MaterialPageRoute(builder: (_) => userPanel()));
    }
    return null;
  }*/
  /*Future<void> logIn(context) async{
    try{
      Firebase.initializeApp();
      _getEmail();
      _getPassword();
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if(user!=null){
        Fluttertoast.showToast(msg: "Logged In Succesfuly");
        Navigator.push(context, MaterialPageRoute(builder: (context) => userPanel()));
      }
    }
    catch(error){
      Fluttertoast.showToast(
        msg: error.toString(),
        timeInSecForIosWeb: 3,
      );
    }
  }*/

  Future admin(BuildContext context) async {
    _getPassword();
    _getEmail();
    if(email=='admin' && password =='admin') {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => adminPanel()));
    }

  }
}