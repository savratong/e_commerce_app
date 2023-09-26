import 'package:e_commerce_app/models/response/product_model.dart';
import 'package:e_commerce_app/viewmodels/add_to_favorite_viewmodel.dart';
import 'package:e_commerce_app/views/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavouriteViewModel favouriteViewModel;
  late SharedPreferences sharedPreferences;
  List<ProductData> favItems = [];

  @override
  void initState() {
    super.initState();

    favouriteViewModel =
        Provider.of<FavouriteViewModel>(context, listen: false);
    favItems = favouriteViewModel.favoriteItem;
  }

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
      body: Consumer<FavouriteViewModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                itemCount: favItems.length,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.58,
                ),
                itemBuilder: (builder, index) {
                  return ProductCard(
                    productData: favItems[index],
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
