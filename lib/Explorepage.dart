import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white30,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
