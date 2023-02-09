import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/consent_controller.dart';

class ConsentView extends GetView<ConsentController> {
  const ConsentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConsentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConsentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
