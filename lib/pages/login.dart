import 'package:flutter/material.dart';
import 'package:myapp/firebase_auth_functions/firebase_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const Center(
              child: Text('Register Page'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter Email",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: "Enter Password",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    signInWithEmailAndPassword(
                        emailController.text, passwordController.text, context);
                  },
                  child: const Text("Login")),
            ),
            
          ],
        ),
      ),
    );
  }
}
