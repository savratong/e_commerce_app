import 'package:e_commerce_app/data/response/status.dart';
import 'package:e_commerce_app/viewmodels/category_viewmodel.dart';
import 'package:e_commerce_app/views/home/widgets/category_card.dart';
import 'package:e_commerce_app/views/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeeAllCategory extends StatefulWidget {
  const SeeAllCategory({super.key});

  @override
  State<SeeAllCategory> createState() => _SeeAllCategoryState();
}

class _SeeAllCategoryState extends State<SeeAllCategory> {
  var categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    categoryViewModel.fetchAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("All Cartegory")),
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: CustomScrollView(slivers: [
          //*Category items
          SliverToBoxAdapter(
            child: ChangeNotifierProvider<CategoryViewModel>(
              create: (context) => categoryViewModel,
              child: Consumer<CategoryViewModel>(
                builder: (create, value, _) {
                  switch (value.categories.status) {
                    case Status.LOADING:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.COMPLETE:
                      return GridView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                        itemCount: value.categories.data!.data.length,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            categoryData: value.categories.data!.data[index],
                          );
                        },
                      );
                    default:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
