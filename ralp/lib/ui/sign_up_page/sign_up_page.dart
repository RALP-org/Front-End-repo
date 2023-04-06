import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ralp/ui/home_page/home_page.dart';

import '../../util/ui/routes.dart';
import '../../util/ui/transitions.dart';
import '../sign_in_page/sign_in_page.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<StatefulWidget> createState() => SignUpViewState();
}

class SignUpViewState extends State<SignUpView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _firstName, _lastName, _email, _number, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/home_background.png'),
                fit: BoxFit.fill,
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 139,
                    height: 139,
                    margin: const EdgeInsets.fromLTRB(0, 80, 0, 50),
                    decoration: const BoxDecoration(
                      color: Color(0xff04080F),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(250, 250, 255, 0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(-2, -4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      height: 31,
                      width: 129,
                      color: const Color.fromRGBO(255, 255, 255, 0.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "RALP",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 48.0,
                          color: Color(0xffDAE3E5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 28.0,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 86,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 49, right: 72),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (input) {
                            if (input != null ? input.isEmpty : true) {
                              return 'Please type first name';
                            }
                          },
                          onSaved: (input) => _firstName = input!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Color(0xffFFFFFF),
                          ),
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: Color(0xffFFFFFF),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input != null ? input.isEmpty : true) {
                              return 'Please type last name';
                            }
                          },
                          onSaved: (input) => _lastName = input!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Color(0xffFFFFFF),
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: Color(0xffFFFFFF),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input != null ? input.isEmpty : true) {
                              return 'Please type an email';
                            }
                          },
                          onSaved: (input) => _email = input!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Color(0xffFFFFFF),
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: Color(0xffFFFFFF),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input != null ? input.isEmpty : true) {
                              return 'Please type contact number';
                            }
                          },
                          onSaved: (input) => _number = input!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Color(0xffFFFFFF),
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Contact Number',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: Color(0xffFFFFFF),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input != null ? input.length < 6 : true) {
                              return 'Your password needs to be at least 6 characters long';
                            }
                          },
                          onSaved: (input) => _password = input!,
                          obscureText: true,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0,
                            color: Color(0xffFFFFFF),
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: Color(0xffFFFFFF),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff86878B),
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 58,
                            width: 325,
                            margin: const EdgeInsets.only(top: 45),
                            child: TextButton(
                              onPressed: signUp,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    letterSpacing: 1.0,
                                    color: Color(0xff000000)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 14, bottom: 121),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?    ",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0,
                                  color: Color(0xffFFFFFF),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      SlideRightRoute(
                                          page: const SignInView(),
                                          route: Routes.LOGIN_ROUTE));
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.0,
                                    color: Color(0xffCB7EEF),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _email.trim(),
          password: _password.trim(),
        );
        await _db.collection('users').doc(userCredential.user?.uid).set({
          'username': '$_firstName $_lastName',
          'email': _email,
          'number': _number,
          'preferences': [],
        });
        DocumentSnapshot userSnapshot =
            await _db.collection('users').doc(userCredential.user?.uid).get();
        Object? userData = userSnapshot.data();
        Navigator.pushReplacement(
            context,
            SlideRightRoute(
                page: HomeView(userData), route: Routes.HOME_ROUTE));
      } catch (e) {
        print(e);
      }
    }
  }
}
