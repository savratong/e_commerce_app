import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            "Favorite Product",
          ),
        ),
        actions: [
          Badge(
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications)),
          )
        ],
      ),
      body: const Center(
        child: Center(child: Text("Comming Soon...")),
      ),
    );
  }
}
