import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Men shirt',
    'Men jeans',
    'Adidass',
    'Lacoste',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null); //Close searchbar
              } else {
                query = ""; //Clear searchbar
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null); //Close searchbar
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String> suggestions = [
    //   'Men shirt'
    //       'Men jeans'
    //       'Adidass'
    //       'Lacoste'
    // ];
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;

              showResults(context);
            },
          );
        });
  }
}
