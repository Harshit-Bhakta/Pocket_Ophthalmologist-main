import 'package:flutter/material.dart';

class RetDes extends StatelessWidget {
  const RetDes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        toolbarHeight: 60,
        title: const Text(
          "R E T I N A   D I S E A S E S",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 118, 188),
        //automaticallyImplyLeading: false,
      ),
    );
  }
}
