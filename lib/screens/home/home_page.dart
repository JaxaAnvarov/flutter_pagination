import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.pushNamed(context, '/view');
        },
      ),
      appBar: appBar(),
    );
  }

  appBar() {
    return AppBar(
      title: const Text(
        "Work With Pagination",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }
}
