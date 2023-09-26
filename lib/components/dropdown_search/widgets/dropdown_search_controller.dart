class DropDownSearchController<T> {
  T? selectedItem;

  void Function(T? it)? onSetSelectedItem;

  setSelectedItem(T? it) {
    selectedItem = it;
    if (onSetSelectedItem != null) {
      onSetSelectedItem!(it);
    }
  }

  List<T>? selectedItems;

  void Function(List<T>? it)? onSetSelectedItems;

  setSelectedItems(List<T>? it) {
    selectedItems = it;
    if (onSetSelectedItems != null) {
      onSetSelectedItems!(it);
    }
  }
}
