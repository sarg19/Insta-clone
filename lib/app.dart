import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Loginpage.dart';
import 'Signuppage.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;

    return const MaterialApp(
        home: Screen()
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Instagram',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Billabong',
                    fontWeight: FontWeight.w300,
                    fontSize: 65.0
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *(150/734),
              // height: 100,
              child: Container(
                // color: Colors.white,
              ),
            ),
            Builder(
                builder: (context) {
                  return GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width*(307/375),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogIn()),
                      );
                    },
                  );
                }
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *(59/734),
              child: Container(
                // color: Colors.white,
              ),
            ),
            Builder(
                builder: (context) {
                  return GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width*(307/375),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: const Color(0xFF2196F3),
                          )
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()),
                      );
                    },
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}

