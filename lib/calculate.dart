import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculate extends ChangeNotifier {
  String _output = '5×5';
  bool _bracket = false;
  bool _position = true;

  String get() {
    return _output;
  }

  bool getbool() {
    return _position;
  }

  void screen(String button) {
    _position = true;
    _output = _output.replaceAll('=', '');
    if (_output == 'Invalid Input !') {
      _output = '';
      notifyListeners();
    }
    if (button == 'AC') {
      _output = '';
      notifyListeners();
      return;
    } else if (button == 'delete') {
      _output = _output.substring(0, _output.length - 1);
      notifyListeners();
      return;
    } else if (button == '=') {
      try {
        _position = false;
        String temp = _output;
        temp = temp.replaceAll('×', '*');
        temp = temp.replaceAll('÷', '/');
        temp = temp.replaceAll('%', '*0.01*');
        temp = temp.replaceAll('e', '2.7182818284590452353602874713527');
        temp = temp.replaceAll('π', '3.1415926535897932384626433832795');
        Parser p = Parser();
        Expression exp = p.parse(temp);
        ContextModel cm = ContextModel();
        double solution = exp.evaluate(EvaluationType.REAL, cm);
        _output = '= ' + solution.toString();
        notifyListeners();
        return;
      } catch (e) {
        _output = 'Invalid Input !';
        notifyListeners();
        return;
      }
    } else if (button == '( )') {
      if (_bracket == false) {
        if (_output != '') {
          String last = _output.substring(_output.length - 1, _output.length);
          if (last != '+' &&
              last != '-' &&
              last != '×' &&
              last != '÷' &&
              last != '%') {
            _output = '(';
            notifyListeners();
            return;
          }
        }
        _output += '(';
      } else {
        _output += ')';
      }
      _bracket = !_bracket;
      notifyListeners();
      return;
    } else if (button == 'π' || button == 'e') {
      if (_output != '') {
        String last = _output.substring(_output.length - 1, _output.length);
        if (last != '+' &&
            last != '-' &&
            last != '×' &&
            last != '÷' &&
            last != '%') {
          _output = button;
          notifyListeners();
          return;
        }
      }
      _output += button;
      notifyListeners();
      return;
    } else {
      _output += button;
      notifyListeners();
      return;
    }
  }
}
