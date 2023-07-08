import 'package:e_commerce_app/utils/router.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // automaticallyImplyLeading: false, // Disable the default back arrow
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pushNamed(
        //         RouteGenerator.navigationScreen,
        //       );
        //     },
        //     icon: const Icon(Icons.arrow_back)),
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
        child: Column(
          children: [Text("Favorite")],
        ),
      ),
    );
  }
}
