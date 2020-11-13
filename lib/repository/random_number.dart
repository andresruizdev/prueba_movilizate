import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumber {

  ValueNotifier<List<String>> randomNumbers = ValueNotifier([]);
  Random rand = Random();

  RandomNumber(){
    getRandomNumbers();
  }

  void getRandomNumbers(){
    randomNumbers.value = [];
    for(int number = 0; number < 5; number++){
      randomNumbers.value.add(rand.nextInt(100000).toString());
    }
    randomNumbers.notifyListeners();
  }

  bool containsCousinNumber(String number) {
    for(int characherIndex = 0; characherIndex < number.length; characherIndex++ ){
      if(number.contains('1') || number.contains('3') || number.contains('5') || number.contains('7') || number.contains('9')){
        return true;
      }
    }
    return false;
  }

}