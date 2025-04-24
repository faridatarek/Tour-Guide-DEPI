import 'package:flutter/material.dart';
import 'package:tour_guide/features/navBar/settings/%D9%90About_us.dart';
import 'package:tour_guide/features/navBar/settings/view/Terms_And_Conditions.dart';
import 'package:tour_guide/features/navBar/settings/view/support.dart';

void main() {
  runApp(
    const MaterialApp(
      home: settings_screen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// ignore: camel_case_types
class settings_screen extends StatefulWidget {
  const settings_screen({super.key});

  @override
  State<settings_screen> createState() => _Page2State();
}

class _Page2State extends State<settings_screen> {
  bool _switchLanguageValue = false;
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الإعدادات',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50),
          SwitchListTile(
            value: _switchLanguageValue,
            title: const Text('Language'),
            trackColor: WidgetStateProperty.all(Colors.orangeAccent),
            thumbColor: WidgetStateProperty.all(Colors.white),
            trackOutlineColor: WidgetStateProperty.all(Colors.orange),
            thumbIcon: WidgetStateProperty.all(
              const Icon(Icons.circle, color: Colors.orange),
            ),
            onChanged: (value) {
              setState(() {
                _switchLanguageValue = value;
              });
            },
          ),
          SwitchListTile(
            value: notifications,
            title: const Text('notification'),
            trackColor: WidgetStateProperty.all(Colors.orangeAccent),
            thumbColor: WidgetStateProperty.all(Colors.white),
            trackOutlineColor: WidgetStateProperty.all(Colors.orange),
            thumbIcon: WidgetStateProperty.all(
              const Icon(Icons.circle, color: Colors.orange),
            ),
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),
          _buildButton(
            text: 'About us',
            icon: const Icon(
              Icons.ads_click_sharp,
              color: Colors.deepOrangeAccent,
            ),
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About_us()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildButton(
            text: 'Support',
            icon: const Icon(Icons.support_outlined, color: Colors.green),
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const support()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildButton(
            text: 'Terms and Conditions',
            icon: const Icon(Icons.warning, color: Colors.deepOrangeAccent),
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsAndConditions(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Widget icon,
    required VoidCallback onPress,
  }) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 16, top: 8),
        child: Row(children: [icon, const SizedBox(width: 8), Text(text)]),
      ),
    );
  }
}
