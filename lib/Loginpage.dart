import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insta_clone/Homepage.dart';

import 'Signuppage.dart';
import 'app.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return App();
                          }
                      ));
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    iconSize: 50.0,
                  )
                ],
              ),
              Container(
                height: 60.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
                // child: Image(image: AssetImage('assets/images/instalog.png')),
                child: Text(
                  'Instagram',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Billabong',
                      fontWeight: FontWeight.w300,
                      fontSize: 55.0
                  ),
                ),
              ),
              Container(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey[400]),
                    hintText: 'Username',
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey[400]),
                    hintText: 'Password',
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),
              Builder(
                  builder: (context) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () async{
                        if(_formKey.currentState!.validate()){
                          try{
                            UserCredential user =
                                await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                            if(user != null){
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                }
                              ));
                            }
                          }on FirebaseAuthException catch (error){
                            switch (error.code) {
                              case "invalid-email":
                                errorMessage =
                                "Your email address appears to be malformed.";
                                break;
                              case "wrong-password":
                                errorMessage = "Your password is wrong.";
                                break;
                              case "user-not-found":
                                errorMessage =
                                "User with this email doesn't exist.";
                                break;
                              case "user-disabled":
                                errorMessage =
                                "User with this email has been disabled.";
                                break;
                              case "too-many-requests":
                                errorMessage = "Too many requests";
                                break;
                              case "operation-not-allowed":
                                errorMessage =
                                "Signing in with Email and Password is not enabled.";
                                break;
                              default:
                                errorMessage = "An undefined Error happened.";
                            }
                            Fluttertoast.showToast(msg: errorMessage!);
                            print(error.code);
                          }
                        }
                      },
                    );
                  }
              ),
              Container(
                height: 60.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()),
                            );
                          },
                          child: const Text(
                            'Sign Up.',
                            style: TextStyle(
                                color: Colors.blue
                            ),
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
              Container(
                height: 110.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Instagram or Facebook',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
