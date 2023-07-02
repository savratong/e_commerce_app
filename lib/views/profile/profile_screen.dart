import 'package:e_commerce_app/utils/router.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false, // Disable the default back arrow
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                RouteGenerator.navigationScreen,
              );
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Profile"),
      ),
      body: const Center(
        child: Column(
          children: [Text("Profile")],
        ),
      ),
    );
  }
}
