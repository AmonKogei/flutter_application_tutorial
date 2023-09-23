import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App',
        home: Scaffold(
            appBar: AppBar(
              title: Text("App Bar"),
            ),
            body: Forms()));
  }
}

class Forms extends StatefulWidget {
  const Forms({Key? key}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final GlobalKey<FormState> keys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keys,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your name",
              labelText: "Name",
              icon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill in the details';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
              icon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill in the details';
              }
              return null;
            },
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  if (keys.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Validation successful")),
                    );
                  }
                },
                child: Text("Submit")),
          ),
        ],
      ),
    );
  }
}
