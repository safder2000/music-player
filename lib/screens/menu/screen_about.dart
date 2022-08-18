import 'package:flutter/material.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'About',
          style: TextStyle(
            color: Color.fromARGB(93, 247, 247, 247),
          ),
        )),
        backgroundColor: const Color.fromARGB(255, 1, 64, 64),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.00,
              0.00,
              0.7,
            ],
            colors: [
              Color.fromARGB(255, 1, 64, 64),
              Color.fromARGB(255, 1, 64, 64),
              Color.fromARGB(255, 54, 96, 0),
            ],
          ),
        ),
        child: SafeArea(
            child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Designed&Wrote by safder',
              style: TextStyle(color: Color.fromARGB(186, 255, 255, 255))),
          const SizedBox(
            height: 15,
          ),
        ])),
      ),
    );
  }
}
