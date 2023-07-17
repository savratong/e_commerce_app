import 'package:flutter/material.dart';

class DeleteProductScreen extends StatefulWidget {
  const DeleteProductScreen({super.key});

  @override
  State<DeleteProductScreen> createState() => _DeleteProductScreenState();
}

class _DeleteProductScreenState extends State<DeleteProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Delete Product"),
      ),
      body: const Center(
        child: Text("Comming soon..."),
      ),
    );
  }
}
