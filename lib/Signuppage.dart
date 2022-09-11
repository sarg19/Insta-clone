import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insta_clone/Homepage.dart';
import 'package:insta_clone/Loginpage.dart';
import 'package:insta_clone/app.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final TextEditingController usernamecontroller = new TextEditingController();
  final TextEditingController cpasswordcontroller = new TextEditingController();
  late String _username, _email, _password, _password2, errorMessage;

  final _auth = FirebaseAuth.instance;

  int counter=0;

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
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey[400]),
                    hintText: 'Username',
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _username = value.trim();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: cpasswordcontroller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey[400]),
                    hintText: 'Confirm Password',
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password2 = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17.0, color: Colors.grey[400]),
                    hintText: 'Email ID',
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
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
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        if(_formKey.currentState!.validate()){
                          try{
                            UserCredential user =
                                await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
                            if(user != null){
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                }
                              ));
                            }
                          } on FirebaseAuthException catch (error) {
                            switch (error.code) {
                              case "invalid-email":
                                errorMessage =
                                "Your email address appears to be malformed.";
                                break;
                              case "email-already-in-use":
                                errorMessage = "User with this email already exists.";
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
                            Fluttertoast.showToast(msg: errorMessage);
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      endIndent: 8.0,
                      thickness: 1.0,
                      color: Colors.grey[300],
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      endIndent: 8.0,
                      thickness: 1.0,
                      color: Colors.grey[300],
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
                      'Have an account?',
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
                                  builder: (context) => const LogIn()),
                            );
                          },
                          child: const Text(
                            'Log in.',
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
                height: 70.0,
              ),
              Divider(
                thickness: 1.0,
                color: Colors.grey[300],
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

