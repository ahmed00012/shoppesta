
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoppesta/MyHome.dart';
import 'package:shoppesta/db/Users.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class SignInPage extends StatefulWidget {
  final String title = 'Registration';
  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Image.asset(
              'images/background.jpeg',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            _PhoneSignInSection(Scaffold.of(context))
          ],

        );
      }),
    );
  }

  // Example code for sign out.
  void _signOut() async {
    await _auth.signOut();
  }
}


class _PhoneSignInSection extends StatefulWidget {
  _PhoneSignInSection(this._scaffold);

  final ScaffoldState _scaffold;
  @override
  State<StatefulWidget> createState() => _PhoneSignInSectionState();
}

class _PhoneSignInSectionState extends State<_PhoneSignInSection> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  UserService userService = new UserService();

  String _message = '';
  String _verificationId;

  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
Padding(padding: EdgeInsets.all(40)),
        Padding(
          padding: EdgeInsets.all(10),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white.withOpacity(0.6),
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: TextFormField(
                controller: _phoneNumberController,

                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(


                    labelText: 'Phone number (+x xxx-xxx-xxxx)',
                  icon: Icon(Icons.phone_iphone)
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Phone number (+x xxx-xxx-xxxx)';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
//        TextFormField(
//          controller: _phoneNumberController,
//          decoration: const InputDecoration(
//              labelText: 'Phone number (+x xxx-xxx-xxxx)'),
//          validator: (String value) {
//            if (value.isEmpty) {
//              return 'Phone number (+x xxx-xxx-xxxx)';
//            }
//            return null;
//          },
//        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red.withOpacity(0.7),
            child: MaterialButton(
              onPressed: ()async {
                _verifyPhoneNumber();
              },
              minWidth: MediaQuery.of(context).size.width,
              child: Text(
                "Verify",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,

                ),
              ),
            ),
          ),
        ),

//        Container(
//          padding: const EdgeInsets.symmetric(vertical: 16.0),
//          alignment: Alignment.center,
//          child: RaisedButton(
//            color: Colors.red[900],
//            onPressed: () async {
//              _verifyPhoneNumber();
//            },
//            child: const Text('Verify '),
//          ),
//        ),

        Container(
          width: 200,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Material(

              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white.withOpacity(0.6),
              child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(

                  controller: _smsController,

                  decoration: const InputDecoration(labelText: 'Verification code',
                      icon: Icon(Icons.textsms)
                  ),
                ),
              ),
            ),
          ),

        ),

//        TextField(
//          controller: _smsController,
//          decoration: const InputDecoration(labelText: 'Verification code'),
//        ),
        Container(
          width: 150,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
              child: MaterialButton(
                onPressed: ()async {
                  _signInWithPhoneNumber();
                },
                minWidth: MediaQuery.of(context).size.width,
                child: Text(
                  "Done",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,

                  ),
                ),
              ),
            ),
          ),
        ),

//        Container(
//          padding: const EdgeInsets.symmetric(vertical: 16.0),
//          alignment: Alignment.center,
//          child: RaisedButton(
//            onPressed: () async {
//              _signInWithPhoneNumber();
//            },
//            child: const Text('Sign in with phone number'),
//          ),
//        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            _message,
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }

  // Example code of how to verify phone number
  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      userService.createUser(_phoneNumberController.text);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHome()));

    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message =
        'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      widget._scaffold.showSnackBar(const SnackBar(
        content: Text('Please check your phone for the verification code.'),
      ));
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // Example code of how to sign in with phone.
  void _signInWithPhoneNumber() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: _smsController.text,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _message = 'Successfully signed in, uid: ' + user.uid;
      } else {
        _message = 'Sign in failed';
      }
    });
  }
}

