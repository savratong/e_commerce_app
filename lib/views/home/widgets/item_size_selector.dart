import 'package:flutter/material.dart';

class ItemSizeSelector extends StatefulWidget {
  const ItemSizeSelector({Key? key}) : super(key: key);

  @override
  _ItemSizeSelectorState createState() => _ItemSizeSelectorState();
}

class _ItemSizeSelectorState extends State<ItemSizeSelector> {
  String _selectedSize = '';

  void _onSizeSelected(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ListView(
              children: [
                _buildSizeTile('XS'),
                _buildSizeTile('S'),
                _buildSizeTile('M'),
                _buildSizeTile('L'),
                _buildSizeTile('XL'),
                _buildSizeTile('XXL'),
              ],
            );
          },
        ).then((value) {
          if (value != null) {
            _onSizeSelected(value);
          }
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            _selectedSize.isNotEmpty ? 'Size: $_selectedSize' : '',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildSizeTile(String size) {
    return ListTile(
      title: Text(size),
      onTap: () {
        Navigator.pop(context, size);
      },
    );
  }
}
