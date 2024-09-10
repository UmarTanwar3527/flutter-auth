import 'package:flutter/material.dart';
import 'package:myapp/firebase_auth_functions/firebase_functions.dart';

// Suggested code may be subject to a license. Learn more: ~LicenseLog:4077600774.
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Register'),
        title: Text(widget.title),
        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.red,
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
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    createUserWithEmailAndPassword(
                        emailController.text, passwordController.text, context);
                  },
                  child: const Text("Register")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    FirebaseService.signInwithGoogle(context);
                  },
                  child: const Text("lOGIN WITH GOOGLE")),
            ),
          ],
        ),
      ),
    );
  }
}
