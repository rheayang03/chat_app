import 'package:flutter/material.dart';
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/textfield_styles.dart';
import 'package:chat_app/login_text_field.dart';
import 'package:chat_app/util/spaces.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _mainUrl = 'https://github.com/rheayang03/chat_app/commits/main/';

  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: userNameController.text,
      );
      print('Login successful');
    } else {
      print('Login failed');
    }
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(_mainUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $_mainUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Let\'s sign you in!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const Text(
                  'Welcome back!\nYou\'ve been missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
                Image.asset(
                  'assets/chat_app_illustration.png',
                  height: 200,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginTextField(
                        hintText: 'Enter your username',
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return 'Your username must be at least 5 characters long';
                          } else if (value != null && value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        controller: userNameController,
                      ),
                      verticalSpacing(24),
                      LoginTextField(
                        hashAsterisk: true,
                        controller: passwordController,
                        hintText: 'Enter your password',
                      ),
                    ],
                  ),
                ),
                verticalSpacing(24),
                ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                verticalSpacing(16),
                GestureDetector(
                  onTap: _launchUrl,
                  child: Column(
                    children: [
                      const Text('Find us on'),
                      Text(
                        _mainUrl,
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpacing(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.twitter(
                      size: 20,
                      color: Colors.blue,
                      url: 'https://twitter.com/rheayang03',
                    ),
                    SocialMediaButton.linkedin(
                      url: 'https://linkedin.com/rheayang03',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
