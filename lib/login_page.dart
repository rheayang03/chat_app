import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button clicked');
        },
      ),
      // TODO: Add the text and image from the design
      body: Column(
        children: [
          const Text(
            'Let\'s sign you in!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const Text(
            'Welcome back!\nYou\'ve been missed!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
          Image.network(
            'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
            height: 200,
          ),
          Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(10),
              //child: FlutterLogo(),
              margin: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                          'https://3009709.youcanlearnit.net/Alien_LIL_131338.png')),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24))),
        ],
      ),
    );
  }
}
