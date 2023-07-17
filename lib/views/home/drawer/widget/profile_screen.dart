import 'package:e_commerce_app/views/search/search_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("Profile")),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              icon: const Icon(Icons.search_outlined, size: 30))
        ],
      ),
      body: Column(
        children: [Text("Comming Soon...")],
      ),
    );
  }
}
