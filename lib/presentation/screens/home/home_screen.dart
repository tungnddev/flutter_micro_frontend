import 'package:flutter/material.dart';
import 'package:product/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App bar'),
        ),
        body: const SafeArea(child: HomeProductWidget()));
  }
}
