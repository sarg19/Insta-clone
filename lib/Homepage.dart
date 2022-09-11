import 'package:flutter/material.dart';
import 'package:insta_clone/Explorepage.dart';
import 'package:insta_clone/Profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasBeenPressed1 = true;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;
  bool _hasBeenPressed4 = false;
  bool _hasBeenPressed5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 35.0,
                  )),
              label: ''),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExplorePage()),
                );
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
                size: 35.0,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.black,
                  )),
              label: ''),
          BottomNavigationBarItem(
              icon: GestureDetector(
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Mypfp.jpg')),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
              ),
              label: '')
        ]),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Instagram',
            style: TextStyle(
                color: Colors.black,
                fontSize: 43,
                fontFamily: 'Billabong',
                fontWeight: FontWeight.w200),
          ),
          centerTitle: false,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     // Image(image: AssetImage('assets/images/instalog.png'), fit: BoxFit.fill,),
          //     ConstrainedBox(
          //       constraints: BoxConstraints(minWidth: double.infinity, minHeight: double.infinity),
          //       child: Text(
          //         'Instagram',
          //         // style: TextStyle(
          //         //   fontSize: 200,
          //         //   fontFamily: 'Billabong',
          //         //   fontWeight: FontWeight.w700
          //         // ),
          //       ),
          //     ),
          //     IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_down), color: Colors.black,)
          //   ],
          // ),
          // leading: const Image(image: AssetImage('assets/images/instalog.png')),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform.scale(
                  scale: 1.35,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_box_outlined),
                    color: Colors.black,
                  )),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/messenger.jpg',
                width: 27.0,
                height: 27.0,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Story();
                },
              ),
            ),
            // ListView.builder(
            //   itemBuilder: (BuildContext context, int index) {
            //     return Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           ListTile(
            //             leading: const CircleAvatar(
            //               radius: 20.0,
            //               backgroundImage:
            //                   AssetImage('assets/images/Mypfp.jpg'),
            //             ),
            //             title: const Text(
            //               '_sarg19',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, color: Colors.black),
            //             ),
            //             trailing: IconButton(
            //                 onPressed: () {},
            //                 icon: const Icon(Icons.more_vert)),
            //           ),
            //           GestureDetector(
            //               child: const Padding(
            //                 padding: EdgeInsets.symmetric(vertical: 8.0),
            //                 child: Image(
            //                     image: AssetImage('assets/images/Mypfp.jpg')),
            //               ),
            //               onDoubleTap: () => {
            //                     // setState((){
            //                     // _hasBeenPressed5 = true;
            //                     // })
            //                   }),
            //           ListTile(
            //             leading: IconButton(
            //               onPressed: () => {
            //                 // setState(() {
            //                 //   _hasBeenPressed5 = !_hasBeenPressed5;
            //                 // })
            //               },
            //               icon: _hasBeenPressed5
            //                   ? const Icon(
            //                       Icons.favorite,
            //                       color: Colors.pink,
            //                       size: 30.0,
            //                     )
            //                   : const Icon(
            //                       Icons.favorite_border_outlined,
            //                       color: Colors.black,
            //                       size: 30.0,
            //                     ),
            //             ),
            //             title: Row(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               children: [
            //                 IconButton(
            //                     onPressed: () {},
            //                     icon: Image.asset(
            //                       'assets/images/instagramcommenticon.png',
            //                       width: 27.0,
            //                       height: 27.0,
            //                     )),
            //                 IconButton(
            //                     onPressed: () {},
            //                     icon: Image.asset(
            //                       'assets/images/instagramshareicon.png',
            //                       width: 27.0,
            //                       height: 27.0,
            //                     )),
            //               ],
            //             ),
            //             trailing: IconButton(
            //                 onPressed: () {},
            //                 icon: Icon(
            //                   Icons.bookmark_border,
            //                   color: Colors.black,
            //                   size: 30.0,
            //                 )),
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               TextButton(
            //                   onPressed: () {},
            //                   child: const Text(
            //                     '_sarg19',
            //                     style: TextStyle(
            //                         color: Colors.black,
            //                         fontWeight: FontWeight.bold),
            //                   )),
            //               const Text('Caption here')
            //             ],
            //           )
            //         ],
            //       ),
            //     );
            //   },
            // )
            SizedBox(
              height: 475,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return Post();
                },
              ),
            )
            // ListTile(
            //   leading: const CircleAvatar(
            //     radius: 20.0,
            //     backgroundImage: AssetImage('assets/images/Mypfp.jpg'),
            //   ),
            //   title: const Text('_sarg19', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            //   trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
            // ),
            // GestureDetector(
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(vertical: 8.0),
            //     child: Image(image: AssetImage('assets/images/Mypfp.jpg')),
            //   ),
            //   onDoubleTap: () => {
            //     setState((){
            //       _hasBeenPressed5 = true;
            //     })
            //   }
            // ),
            // ListTile(
            //
            //   leading: IconButton(onPressed: () => {
            //     setState(() {
            //       _hasBeenPressed5 = !_hasBeenPressed5;
            //     })
            //   },
            //     icon: _hasBeenPressed5? const Icon(Icons.favorite, color: Colors.pink, size: 30.0,) : const Icon(Icons.favorite_border_outlined, color: Colors.black, size: 30.0,),),
            //   title: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       IconButton(onPressed: (){}, icon: Image.asset('assets/images/instagramcommenticon.png', width: 27.0, height: 27.0,)),
            //       IconButton(onPressed: (){}, icon: Image.asset('assets/images/instagramshareicon.png', width: 27.0, height: 27.0,)),
            //     ],
            //   ),
            //   trailing: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border, color: Colors.black, size: 30.0,)),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     TextButton(onPressed: (){}, child: const Text('_sarg19', style: TextStyle(
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold
            //     ),)),
            //     const Text('Caption here')
            //   ],
            // )
          ],
        ));
  }
}

// class Post extends StatelessWidget {
//   const Post({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           leading: const CircleAvatar(
//             radius: 20.0,
//             backgroundImage: AssetImage('assets/images/Mypfp.jpg'),
//           ),
//           title: const Text('_sarg19', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
//           trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
//         ),
//         GestureDetector(
//             child: const Padding(
//               padding: EdgeInsets.symmetric(vertical: 8.0),
//               child: Image(image: AssetImage('assets/images/Mypfp.jpg')),
//             ),
//             onDoubleTap: () => {
//               // setState((){
//               //   _hasBeenPressed5 = true;
//               // })
//             }
//         ),
//         ListTile(
//
//           leading: IconButton(onPressed: () => {
//             // setState(() {
//             //   _hasBeenPressed5 = !_hasBeenPressed5;
//             // })
//           },
//             icon: Icon(Icons.favorite_border_outlined, color: Colors.black, size: 30.0,),),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               IconButton(onPressed: (){}, icon: Image.asset('assets/images/instagramcommenticon.png', width: 27.0, height: 27.0,)),
//               IconButton(onPressed: (){}, icon: Image.asset('assets/images/instagramshareicon.png', width: 27.0, height: 27.0,)),
//             ],
//           ),
//           trailing: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border, color: Colors.black, size: 30.0,)),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             TextButton(onPressed: (){}, child: const Text('_sarg19', style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold
//             ),)),
//             const Text('Caption here')
//           ],
//         )
//       ],
//     );
//   }
// }

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage('assets/images/Mypfp.jpg'),
          ),
          title: const Text('_sarg19', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ),
        GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Image(image: AssetImage('assets/images/Mypfp.jpg')),
            ),
            onDoubleTap: () => {
              // setState((){
              //   _hasBeenPressed5 = true;
              // })
            }
        ),
        ListTile(

          leading: IconButton(onPressed: () => {
            // setState(() {
            //   _hasBeenPressed5 = !_hasBeenPressed5;
            // })
          },
            icon: Icon(Icons.favorite_border_outlined, color: Colors.black, size: 30.0,),),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){}, icon: Image.asset('assets/images/instagramcommenticon.png', width: 27.0, height: 27.0,)),
              IconButton(onPressed: (){}, icon: Image.asset('assets/images/instagramshareicon.png', width: 27.0, height: 27.0,)),
            ],
          ),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border, color: Colors.black, size: 30.0,)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(onPressed: (){}, child: const Text('_sarg19', style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),)),
            const Text('Caption here')
          ],
        )
      ],
    );
  }
}

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 6.0, 6.0, 6.0),
              child: CircleAvatar(
                radius: 35.0,
                backgroundImage:
                AssetImage('assets/images/Mypfp.jpg'),
              ),
            ),
            onTap: () {},
          ),
          const Text(
            'Your Story',
            style: TextStyle(fontSize: 15.0),
          )
        ],
      ),
    );;
  }
}

