import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Profile"),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         showSearch(
        //           context: context,
        //           delegate: MySearchDelegate(),
        //         );
        //       },
        //       icon: const Icon(Icons.search_outlined, size: 30))
        // ],
      ),
      body: const Center(
        child: Text("Comming Soon..."),
      ),
    );
  }
}
