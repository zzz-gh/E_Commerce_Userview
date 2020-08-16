import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/db/users.dart';
import 'dart:async';
import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _comfirmPasswordController = TextEditingController();
  bool loading = false;
  String gender;
  String groupValue = '';
  bool hidePwd = true;

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
                child: Flexible(
                  fit: FlexFit.loose,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 40.0,
                      ),
                      //========Name========
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.9,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter Full Name',
                              hoverColor: Colors.red,
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            controller: _nameTextController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),

                      //=============Email===============
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

                      //========Radio button=====
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Material(
                          color: Colors.white70.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(7.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  leading: Text(
                                    'male',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Radio(
                                    value: 'male',
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  leading: Text(
                                    'female',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Radio(
                                    value: 'female',
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              ),
                            ],
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
                          child: ListTile(
                            title: TextFormField(
                              obscureText: hidePwd,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
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
                                } else if (_passwordTextController.text !=
                                    value) {
                                  return 'Password do not match';
                                }
                                return null;
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePwd = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                      //======Confirm password=======
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.9,
                          child: ListTile(
                            title: TextFormField(
                              obscureText: hidePwd,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm password',
                                hoverColor: Colors.red,
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              controller: _comfirmPasswordController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 8) {
                                  return 'Your password must have 8 characters or longer';
                                }
                                return null;
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePwd = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                      //========Register button======
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue,
                            elevation: 0.9,
                            child: MaterialButton(
                                onPressed: () async {
                                  setState(() {
                                    validateForm();
                                  });
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ))),
                      ),

                      //=======Login=========
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
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

  valueChanged(e) {
    setState(() {
      if (e == 'male') {
        groupValue = e;
        gender = e;
      } else if (e == 'female') {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((user) => _userServices.createUser({
                  "username": _nameTextController.text,
                  "email": _emailTextController.text,
                  "userId":user.user.uid,
                  "gender": gender,
                })).catchError((err)=>print(err.toString()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      }
    }
  }
}
