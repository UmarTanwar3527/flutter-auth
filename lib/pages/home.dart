import 'package:flutter/material.dart';
import 'package:myapp/firebase_auth_functions/firebase_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Screen"),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Home Screen"),
            ),
            ElevatedButton(
                onPressed: () {
                  signOut(context);
                },
                child: const Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
