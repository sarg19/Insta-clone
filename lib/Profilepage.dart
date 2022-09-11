import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'app.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: const Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
            child: Text(
              '_sarg19',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
        ),
        title: IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add_box_outlined, color: Colors.black,)),
          IconButton(
              onPressed: (){
                auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => App()
                    )
                );
              },
              icon: const Icon(Icons.menu, color: Colors.black,))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Mypfp.jpg'),
                  radius: 40.0,
                ),
                Column(
                  children: const [
                    Text(
                      '1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.0
                      ),
                    ),
                    Text('Posts',
                      style: TextStyle(
                        fontSize: 15.0
                      ),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      '182',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Text('Followers',
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      '230',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0
                      ),
                    ),
                    Text('Following',
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
            child: Text(
              'Sarvesh',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
            child: Text(
              'Developer',
            ),
          )
        ],
      ),
    );
  }
}
