import 'package:flutter/material.dart';

class ScreenNerdy extends StatelessWidget {
  const ScreenNerdy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Nerdy Stuffs',
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
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    'Privacy and Policy',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'Data is critical for businesses that process that information to provide services and products to their customers. From a corporate context, in a company - from the top executive level right down to the operational level - just about everyone relies heavily on information.In a complex environment where so much depends on the data that businesses collect and process, protecting that information becomes increasingly important. Among the steps business owners take to protect the data of their users, drafting a clear and concise Privacy Policy agreement holds central importance.In this article, we will discuss the elements of a Privacy Policy to help you better understand the constructs of an effective Privacy Policy agreement that instills faith and trust in your customers and protects you from a number of liability issues.',
                  style: TextStyle(color: Color.fromARGB(186, 255, 255, 255))),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, Webiste Name accessible at Website.com.These Terms will be applied fully and affect to your use of this app. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this app if you disagree with any of these Website Standard Terms and Conditions.Minors or people below 5 years old are not allowed to use this App.',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            ],
          ),
        ),
      ),
    );
  }
}
