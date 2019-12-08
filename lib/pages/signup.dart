import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool showPassword=true;

  SharedPreferences sharedPreferences;
  bool loading = false;
  bool islogedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        centerTitle: true,
//          title: Text("login"),
//        elevation: 0.1,
//      ),
      resizeToAvoidBottomPadding:false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/background.jpeg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black87.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.center,
            child: Center(
              child: Form(

                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 200)),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.6),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "full name",
                                icon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.6),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.6),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: ListTile(
                              title: TextFormField(
                              obscureText: showPassword,
                              decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                              ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "password cannot be empty";
                                  }
                                  if (value.length < 6) {
                                    return "password has to be at least 6 characters";
                                  }
                                  return null;
                                },
                            ),
                              trailing: IconButton(icon:Icon( Icons.remove_red_eye), onPressed:(){
                                setState(() {
                                  showPassword=false;
                                });

                              }),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.6),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: ListTile(
                              title:  TextFormField(
                                obscureText: showPassword,
                            decoration: InputDecoration(
                            hintText: "confirm password",
                              icon: Icon(Icons.lock_outline),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "password cannot be empty";
                              }
                              if (value.length < 6) {
                                return "password has to be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                              trailing: IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                                setState(() {
                                  showPassword=false;
                                });
                              }),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red.withOpacity(0.7),
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,

                              ),
                            ),
                          ),
                        ),
                      ),



                    ],
                  )),
            ),
          ),
//          Center(
//            child: FlatButton(onPressed: (){handleSignIn();}, color: Colors.red.shade900,
//            child: Text("login with google"),),
//          ),
          Visibility(
              visible: loading ?? true,
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ))
        ],
      ),
    );
  }
  void validateform() async{

  }
}


