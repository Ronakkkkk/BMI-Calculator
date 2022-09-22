import 'dart:math';

class BmiBrain {
  final int height;
  final int weight;
  double _bmi;

  BmiBrain(this.height, this.weight);

  String calculatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal bodyweight, try to exercise more and have a calorie deficit diet!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight, Good job!';
    } else {
      return 'You have a lower than normal bodyweight, you can have a calorie surplus diet!';
    }
  }
}
