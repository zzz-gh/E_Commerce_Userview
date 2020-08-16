import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    await firebaseAuth.currentUser().then((user) => {
      if(user != null){
        setState(()=>isLogedin=true)
      }
    });
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyApp()));
    }
    setState(() {
      loading = false;
    });
  }

//  Future<FirebaseUser> handleSignIn() async {
//    preferences = await SharedPreferences.getInstance();
//    setState(() {
//      loading = true;
//    });
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/bg.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
            height: double.infinity,
            width: double.infinity,
          ),
          //========Email and password typing box========
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.9,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            hoverColor: Colors.red,
                            icon: Icon(
                              Icons.alternate_email,
                              color: Colors.white,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailTextController,
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp exp = new RegExp(pattern);
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            } else if (!exp.hasMatch(value)) {
                              return 'Please make sure your email valid';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    //=======Password typing box here======
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                        elevation: 0.9,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            hoverColor: Colors.red,
                            icon: Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordTextController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 8) {
                              return 'Your password must have 8 characters or longer';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.blue,
                          elevation: 0.9,
                          child: MaterialButton(
                              onPressed: () {},
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Row(
                            children: <Widget>[
                              Text('Don\'t you have account? Click here to ',style: TextStyle(color: Colors.white,),),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                                },
                                child: Text(' Sign up',style: TextStyle(color: Colors.red,fontSize: 16.0),),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 200.0,
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Other  Login option',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),

                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),

      //=======sign  in /sign up with google button========
    );
  }
}
