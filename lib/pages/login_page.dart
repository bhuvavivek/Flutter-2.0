import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                style: BorderStyle.solid,
                color: Colors.black38,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(6, 5),
                    blurRadius: 10,
                    color: Colors.black26.withOpacity(0.5))
              ]),
        ),
      ),
    );
  }
}
