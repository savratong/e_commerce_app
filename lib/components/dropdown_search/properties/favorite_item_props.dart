import 'package:e_commerce_app/components/dropdown_search/ex_dropdown_search.dart';
import 'package:flutter/material.dart';

class FavoriteItemProps<T> {
  ///show or hide favorites items
  final bool showFavoriteItems;

  ///to customize favorites chips
  final FavoriteItemsBuilder<T>? favoriteItemBuilder;

  ///favorites items list
  final FavoriteItems<T>? favoriteItems;

  ///favorite items alignment
  final MainAxisAlignment favoriteItemsAlignment;

  const FavoriteItemProps({
    this.favoriteItemBuilder,
    this.favoriteItems,
    this.favoriteItemsAlignment = MainAxisAlignment.start,
    this.showFavoriteItems = false,
  });
}
