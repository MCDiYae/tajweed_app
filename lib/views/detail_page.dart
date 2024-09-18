import 'package:flutter/material.dart';
import 'package:tajweed_app/model/tajweed.dart';

class RuleDetailPage extends StatelessWidget {
  final Tajweed rule;

  const RuleDetailPage({super.key, required this.rule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // actions: [
        //   Container(
        //     margin: const EdgeInsets.all(8.0),
        //     child: IconButton(
        //       icon: const Icon(Icons.arrow_forward_outlined),
        //       color: Colors.black,
        //       onPressed: () => Navigator.of(context).pop(),
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            height: 250,
            rule.image,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              rule.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              rule.definition,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
