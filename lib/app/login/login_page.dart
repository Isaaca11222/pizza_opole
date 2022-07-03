import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 238, 233),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Zaloguj się"),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: "Hasło"),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } catch (error) {
                    print(error);
                  }
                },
                child: Text('Zaloguj się'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
