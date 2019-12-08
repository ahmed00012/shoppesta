//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shoppesta/MyHome.dart';
//import 'package:toast/toast.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
//
//import 'signup.dart';
//
//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      resizeToAvoidBottomPadding:false,
////      appBar: AppBar(
////        backgroundColor: Colors.white,
////        centerTitle: true,
////          title: Text("login"),
////        elevation: 0.1,
////      ),
//      body: Stack(
//        children: <Widget>[
//          Image.asset(
//            'images/background.jpeg',
//            fit: BoxFit.fill,
//            width: double.infinity,
//            height: double.infinity,
//          ),
//          Container(
//            color: Colors.black87.withOpacity(0.5),
//            width: double.infinity,
//            height: double.infinity,
//          ),
//          Container(
//            alignment: Alignment.center,
//            child: Center(
//
//              child: Form(
//                  key: _formkey,
//                  child: Column(
//                    children: <Widget>[
//                      Padding(padding: EdgeInsets.only(top: 200)),
//                      Padding(
//                        padding: EdgeInsets.all(10),
//                        child: Material(
//                          borderRadius: BorderRadius.circular(10.0),
//                          color: Colors.white.withOpacity(0.6),
//                          child: Padding(
//                            padding: EdgeInsets.only(left: 12),
//                            child: TextFormField(
//                              decoration: InputDecoration(
//                                hintText: "Email",
//                                icon: Icon(Icons.email),
//                                border: OutlineInputBorder(),
//
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.all(10),
//                        child: Material(
//                          borderRadius: BorderRadius.circular(10.0),
//                          color: Colors.white.withOpacity(0.6),
//                          child: Padding(
//                            padding: EdgeInsets.only(left: 12),
//                            child: TextFormField(
//                              decoration: InputDecoration(
//                                hintText: "password",
//                                icon: Icon(Icons.lock_outline),
//                                border: OutlineInputBorder(),
//                              ),
//                              validator: (value) {
//                                if (value.isEmpty) {
//                                  return "password cannot be empty";
//                                }
//                                if (value.length < 6) {
//                                  return "password has to be at least 6 characters";
//                                }
//                                return null;
//                              },
//                            ),
//                          ),
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.all(10),
//                        child: Material(
//                          borderRadius: BorderRadius.circular(20),
//                          color: Colors.red.withOpacity(0.7),
//                          child: MaterialButton(
//                            onPressed: () {
//                              Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyHome()));
//                            },
//                            minWidth: MediaQuery.of(context).size.width,
//                            child: Text(
//                              "login",
//
//                              style: TextStyle(
//                                color: Colors.white,
//                                fontSize: 15,
//
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                      Padding(padding: EdgeInsets.all(4),
//                      child:InkWell(
//                        onTap: (){},
//                        child:Text("forgot password ? ",
//                            style: TextStyle(color: Colors.white60)),
//                      ) ,),
//
//                      Padding(
//                        padding: EdgeInsets.all(10),
//                        child:InkWell(
//                          onTap: (){
//                            Navigator.push(context, MaterialPageRoute(builder: (context)=> new signup() ));
//                          },
//                          child:Text("create account ",
//                              style: TextStyle(
//                                  color: Colors.yellow.withRed(100),
//                                  fontSize: 16)),
//                        )
//                      ),
//                      Divider(),
//                      Padding(
//                        padding: EdgeInsets.all(10),
//                        child: Material(
//                          borderRadius: BorderRadius.circular(20),
//                          color: Colors.blue.withOpacity(0.7),
//                          child: MaterialButton(
//                            onPressed: () {},
//                            minWidth: MediaQuery.of(context).size.width,
//                            child: Row(
//                              children: <Widget>[
//                                Image.asset(
//                                  "images/search.png",
//                                  alignment: Alignment.centerLeft,
//                                ),
//                                Padding(padding: EdgeInsets.only(left: 90)),
//                                Text(
//                                  "login with google",
//                                  style: TextStyle(
//                                    color: Colors.white,
//
//                                    fontSize: 15,
////                                    fontWeight: FontWeight.bold,
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  )),
//            ),
//          ),
////          Center(
////            child: FlatButton(onPressed: (){handleSignIn();}, color: Colors.red.shade900,
////            child: Text("login with google"),),
////          ),
//          Visibility(
//              visible: loading ?? true,
//              child: Container(
//                alignment: Alignment.center,
//                color: Colors.white.withOpacity(0.7),
//                child: CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                ),
//              ))
//        ],
//      ),
//    );
//  }
//}
////import 'dart:async';
////import 'dart:convert' show json;
////
////import "package:http/http.dart" as http;
////import 'package:flutter/material.dart';
////import 'package:google_sign_in/google_sign_in.dart';
////
////GoogleSignIn _googleSignIn = GoogleSignIn(
////  scopes: <String>[
////    'email',
////    'https://www.googleapis.com/auth/contacts.readonly',
////  ],
////);
////
////
////class SignInDemo extends StatefulWidget {
////  @override
////  State createState() => SignInDemoState();
////}
////
////class SignInDemoState extends State<SignInDemo> {
////  GoogleSignInAccount _currentUser;
////  String _contactText;
////
////  @override
////  void initState() {
////    super.initState();
////    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
////      setState(() {
////        _currentUser = account;
////      });
////      if (_currentUser != null) {
////        _handleGetContact();
////      }
////    });
////    _googleSignIn.signInSilently();
////  }
////
////  Future<void> _handleGetContact() async {
////    setState(() {
////      _contactText = "Loading contact info...";
////    });
////    final http.Response response = await http.get(
////      'https://people.googleapis.com/v1/people/me/connections'
////          '?requestMask.includeField=person.names',
////      headers: await _currentUser.authHeaders,
////    );
////    if (response.statusCode != 200) {
////      setState(() {
////        _contactText = "People API gave a ${response.statusCode} "
////            "response. Check logs for details.";
////      });
////      print('People API ${response.statusCode} response: ${response.body}');
////      return;
////    }
////    final Map<String, dynamic> data = json.decode(response.body);
////    final String namedContact = _pickFirstNamedContact(data);
////    setState(() {
////      if (namedContact != null) {
////        _contactText = "I see you know $namedContact!";
////      } else {
////        _contactText = "No contacts to display.";
////      }
////    });
////  }
////
////  String _pickFirstNamedContact(Map<String, dynamic> data) {
////    final List<dynamic> connections = data['connections'];
////    final Map<String, dynamic> contact = connections?.firstWhere(
////          (dynamic contact) => contact['names'] != null,
////      orElse: () => null,
////    );
////    if (contact != null) {
////      final Map<String, dynamic> name = contact['names'].firstWhere(
////            (dynamic name) => name['displayName'] != null,
////        orElse: () => null,
////      );
////      if (name != null) {
////        return name['displayName'];
////      }
////    }
////    return null;
////  }
////
////  Future<void> _handleSignIn() async {
////    try {
////      await _googleSignIn.signIn();
////    } catch (error) {
////      print(error);
////    }
////  }
////
////  Future<void> _handleSignOut() async {
////    _googleSignIn.disconnect();
////  }
////
////  Widget _buildBody() {
////    if (_currentUser != null) {
////      return Column(
////        mainAxisAlignment: MainAxisAlignment.spaceAround,
////        children: <Widget>[
////          ListTile(
////            leading: GoogleUserCircleAvatar(
////              identity: _currentUser,
////            ),
////            title: Text(_currentUser.displayName ?? ''),
////            subtitle: Text(_currentUser.email ?? ''),
////          ),
////          const Text("Signed in successfully."),
////          Text(_contactText ?? ''),
////          RaisedButton(
////            child: const Text('SIGN OUT'),
////            onPressed: _handleSignOut,
////          ),
////          RaisedButton(
////            child: const Text('REFRESH'),
////            onPressed: _handleGetContact,
////          ),
////        ],
////      );
////    } else {
////      return Column(
////        mainAxisAlignment: MainAxisAlignment.spaceAround,
////        children: <Widget>[
////          const Text("You are not currently signed in."),
////          RaisedButton(
////            child: const Text('SIGN IN'),
////            onPressed: _handleSignIn,
////          ),
////        ],
////      );
////    }
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////        appBar: AppBar(
////          title: const Text('Google Sign In'),
////        ),
////        body: ConstrainedBox(
////          constraints: const BoxConstraints.expand(),
////          child: _buildBody(),
////        ));
////  }
////}
