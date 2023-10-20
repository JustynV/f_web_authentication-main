import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class SendButton extends StatelessWidget {

  SendButton({super.key, required this.a, required this.b, required this.operation, });
  final OperationController opController = Get.find();

  final String a;
  final String b;
  final String operation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      onPressed: () {
        logInfo(a);
        logInfo(b);
        opController.updateCorrect(int.parse(a), int.parse(b), operation);
      },
      child: const Text(
        "GO",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}