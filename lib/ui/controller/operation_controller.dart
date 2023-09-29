import 'dart:math';

import 'package:f_web_authentication/domain/use_case/operation_usercase.dart';
import 'package:get/get.dart';

class OperationController extends GetxController {
  OperationController();

  RxString input = "0".obs;
  RxInt correct = 0.obs;
  RxInt difficulty = 1.obs;
  RxInt tries = 6.obs;
  OperationUsercase opUsercase = Get.find();
  var rng = Random();

  void init(){
    correct.value = 0;
    tries.value = 6;
  }

  void setDifficulty(int correct) {
    difficulty.value = opUsercase.setDifficulty(difficulty.value, correct);
  }

  int getDifficulty() {
    return difficulty.value;
  }

  String generateNum() {
    return (rng.nextInt(pow(num.parse("10"), difficulty.value).toInt()) + 1)
        .toString();
  }



  List getEjercicios() {
    List ejercicios = [];
    for (int i = 0; i <= 5; i++) {
      String a = generateNum();
      String b = generateNum();
      if(int.parse(b) > int.parse(a)){
        ejercicios.add([b,a]);
      }else{
        ejercicios.add([a, b]);
      }
    }
    return ejercicios;
  }


  void updateInput(String i) {
    if (input.value == "0") {
      input.value = i;
    } else {
      input.value = input.value + i;
    }
  }
  void resetInput() {
    input.value = "0";
  }

  void updateCorrect(int a, int b, String operation){
    correct.value = checkAnswer(a, b, operation);
  }

  int checkAnswer(int a, int b, String operation) {
    int intput = int.parse(input.value);

    switch (operation) {
      case "+":
        if (a + b == intput) {
          return 1;
        }
        return 0;
      case "-":
        if (a - b == intput) {
          return 1;
        }
        return 0;
      case "*":
        if (a * b == intput) {
          return 1;
        }
        return 0;
      case "/":
        if ((a / b).round() == intput) {
          return 1;
        }
        return 0;
    }
    return 0;
  }
}
