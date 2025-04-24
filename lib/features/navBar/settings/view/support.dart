import 'package:flutter/material.dart';

class support extends StatelessWidget {
  const support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
            '''يمكنك التواصل معنا من خلال الارقام الشات الخاص بنا او عن طريق  الارقام الموضحه  
        011234567890'''),
      ),
    );
  }
}
