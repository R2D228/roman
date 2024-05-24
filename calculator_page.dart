import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  String _input = "";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "CLEAR") {
        _output = "0";
        _input = "";
        _operator = "";
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _num1 = double.parse(_input);
        _operator = buttonText;
        _input = "";
      } else if (buttonText == ".") {
        if (!_input.contains(".")) {
          _input += buttonText;
        }
      } else if (buttonText == "=") {
        _num2 = double.parse(_input);

        if (_operator == "+") {
          _output = (_num1 + _num2).toString();
        } else if (_operator == "-") {
          _output = (_num1 - _num2).toString();
        } else if (_operator == "*") {
          _output = (_num1 * _num2).toString();
        } else if (_operator == "/") {
          _output = (_num1 / _num2).toString();
        }

        _num1 = 0;
        _num2 = 0;
        _input = _output;
        _operator = "";
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 12.0,
          ),
          child: Text(
            _output,
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton("."),
                _buildButton("0"),
                _buildButton("00"),
                _buildButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                _buildButton("CLEAR"),
                _buildButton("="),
              ],
            ),
          ],
        )
      ],
    );
  }
}
