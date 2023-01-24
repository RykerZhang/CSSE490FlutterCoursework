import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmailPasswordAuthPage extends StatefulWidget {
  final bool isNewUser;
  const EmailPasswordAuthPage({
    required this.isNewUser,
    super.key,
  });

  @override
  State<EmailPasswordAuthPage> createState() => _EmailPasswordAuthPageState();
}

class _EmailPasswordAuthPageState extends State<EmailPasswordAuthPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    //MovieQuoteDocumentManager.instance.stopListening(movieQuoteSubscription!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.isNewUser ? "Create a New User" : "Log in an Exising User"),
      ),
      body: Column(children: [
        const SizedBox(
          height: 250.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: emailTextController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: passwordTextController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Password",
            ),
          ),
        ),
        Container(
          height: 40.0,
          width: 220.0,
          child: ElevatedButton(
            onPressed: () {
              if (widget.isNewUser) {
                print(
                    "Email: ${emailTextController.text} Password:${passwordTextController.text}");
              } else {}
            },
            child: Text(widget.isNewUser
                ? "Create a New User"
                : "Log in an Exising User"),
          ),
        )
      ]),
    );
  }
}
