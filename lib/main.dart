import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          textTheme: TextTheme(
            headline1: TextStyle(),
          )),
      home: const MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double num1 = 0;
  double num2 = 0;
  bool v = true;
  var op = '';
  bool point = false;
  late double output;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    output = 0;
  }

  void cal(String c) {
    if (c == 's') {
      output = output * output;
    } else if (c == 'sr') {
      output = sqrt(output);
    }
    setState(() {});
  }

  void operations(String op) {
    if (op == '-') {
      output = num2 - num1;
    }
    if (op == '+') {
      output = num2 + num1;
    }
    if (op == '/') {
      output = num2 / num1;
    }
    if (op == '*') {
      output = num2 * num1;
    }
    if (op == '%') {
      output = num2 % num1;
    }
    num2 = output;
    setState(() {});
  }

  Text? display() {
    if (v) {
      v = false;
      return Text(
        output.toStringAsFixed(0),
        style: TextStyle(color: Colors.white, fontSize: 50),
      );
    } else {
      return Text(
        output.toStringAsFixed(5),
        style: TextStyle(color: Colors.white, fontSize: 50),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40, bottom: 45),
                  child: display(),
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          num1 = 0;
                          output = num1;
                          setState(() {
                            v = true;
                          });
                        },
                        icon: Icon(FontAwesomeIcons.c),
                        color: Colors.blue.shade300,
                      ),
                      IconButton(
                        onPressed: () {
                          cal('s');
                        },
                        icon: Icon(FontAwesomeIcons.square),
                        color: Colors.blue.shade300,
                      ),
                      IconButton(
                        onPressed: () {
                          cal('sr');
                        },
                        icon: Icon(FontAwesomeIcons.squareRootVariable),
                        color: Colors.blue.shade300,
                      ),
                      IconButton(
                        onPressed: () {
                          op = '%';
                          num2 = num1;
                          num1 = 0;
                        },
                        icon: Icon(FontAwesomeIcons.percent),
                        color: Colors.blue.shade300,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 7;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.seven),
                      ),
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 8;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.eight),
                      ),
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 9;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.nine),
                      ),
                      IconButton(
                        onPressed: () {
                          op = '*';
                          num2 = num1;
                          num1 = 0;
                        },
                        icon: Icon(FontAwesomeIcons.times),
                        color: Colors.blue.shade300,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 4;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.four),
                      ),
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 5;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.five),
                      ),
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 6;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.six),
                      ),
                      IconButton(
                        onPressed: () {
                          op = '/';
                          num2 = num1;
                          num1 = 0;
                        },
                        icon: Icon(FontAwesomeIcons.divide),
                        color: Colors.blue.shade300,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 1;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.one),
                      ),
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 2;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.two),
                      ),
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 3;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.three),
                      ),
                      IconButton(
                        onPressed: () {
                          op = '-';
                          num2 = num1;
                          num1 = 0;
                        },
                        icon: Icon(FontAwesomeIcons.minus),
                        color: Colors.blue.shade300,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 100;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.diceTwo),
                      ),
                      IconButton(
                        onPressed: () {
                          num1 = num1 * 10 + 0;
                          output = num1;
                          setState(() {});
                        },
                        icon: Icon(FontAwesomeIcons.zero),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          op = '+';
                          num2 = num1;
                          num1 = 0;
                        },
                        icon: Icon(FontAwesomeIcons.add),
                        color: Colors.blue.shade300,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 45),
                        child: Container(
                          width: 230,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 7)
                              ]),
                          child: ElevatedButton(
                            onPressed: () {
                              operations(op);
                            },
                            child: Text(
                              '=',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: IconButton(
                            onPressed: () {
                              output = (output - (output % 10)) / 10;

                              //output = num1;
                              setState(() {
                                if (output == 0) {
                                  v = true;
                                }
                              });
                            },
                            icon: Icon(FontAwesomeIcons.backspace)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
