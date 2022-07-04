import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  String expression = "";

  buttonPressed(String value) {
    /* print(value);
    setState(() {
      if (value == "CLEAR") {
        result = "0";
      } else if (value == ".") {
        if (result.contains(".")) {
          return;
        } else {
          result = result + value;
        }
      } else if (value == "=") {
        expression = result.replaceAll("x", "*");

        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        dynamic calculate = exp.evaluate(EvaluationType.REAL, cm);
        result = "$calculate";
      } else {
        if (result == "0") {
          result = value;
        } else {
          result = result + value;
        }
      }
    });*/
  }


  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      print(text);
      /* if (text == "x") {
        _expression += text.replaceAll('x', '*');
      }else{
        _expression += text;

      } */
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  Widget _buildMyButton(String labelButton, Function callback) {
    return Expanded(
        child: OutlinedButton(
            // padding:EdgeInsets.all(24),
            //  onPressed: () => buttonPressed(labelButton),
            onPressed: () => callback(labelButton),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                labelButton,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Calculator'),
          ),
          body: SafeArea(
            child: Column(
              children: [
               

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(_history,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)
                       
                        ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(_expression,//.replaceAll('x', '*'),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        )
                       
                        ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        _buildMyButton('AC', allClear),
                        _buildMyButton('C', clear),
                        _buildMyButton('%', numClick),
                        _buildMyButton('/', numClick),
                      ],
                    ),
                    Row(
                      children: [
                        _buildMyButton('7', numClick),
                        _buildMyButton('8', numClick),
                        _buildMyButton('9', numClick),
                        _buildMyButton('*', numClick),
                      ],
                    ),
                    Row(
                      children: [
                        _buildMyButton('4', numClick),
                        _buildMyButton('5', numClick),
                        _buildMyButton('6', numClick),
                        _buildMyButton('-', numClick),
                      ],
                    ),
                    Row(
                      children: [
                        _buildMyButton('1', numClick),
                        _buildMyButton('2', numClick),
                        _buildMyButton('3', numClick),
                        _buildMyButton('+', numClick),
                      ],
                    ),
                    Row(
                      children: [
                        _buildMyButton('.', numClick),
                        _buildMyButton('0', numClick),
                        _buildMyButton('00', numClick),
                        _buildMyButton('=', evaluate),
                      ],
                    ),
                   
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
