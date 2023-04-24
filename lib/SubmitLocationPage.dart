import 'package:flutter/material.dart';

class SubmitLocationPage extends StatelessWidget {
  const SubmitLocationPage({super.key, required this.location});
  final String location;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(title: const Text('')),
            body: Center(
              child: Text(location),
            )));
  }
}
