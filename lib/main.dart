import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progression calc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Progression calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _startCost = 0;
  double _multiplier = 0;
  int _iterations = 10;
  double _amount = 0;
  String data = "";

  void setStartCost(String s){
    _startCost = double.parse(s);
    _calculate();
  }

  void setMultiplier(String s){
    _multiplier = double.parse(s);
    _calculate();
  }

  void setIteration(String s){
    _iterations = int.parse(s);
    _calculate();
  }

  void _calculate() {
    setState(() {
      data = "";
      _amount = _startCost/10;
      for(int i = 0; i < _iterations; i++){
        double tempAmount = _amount*10;
        data += "Iteration: $i >> $tempAmount \n";
        _amount = (_amount * _multiplier).ceil().toDouble();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600.0), 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                child: TextFormField(
                  initialValue: "0",
                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "start cost"),
                  onChanged: setStartCost,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600.0), 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                child: TextFormField(
                  initialValue: "0",
                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "multiplier"),
                  onChanged: setMultiplier,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600.0), 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                child: TextFormField(
                  initialValue: "10",
                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "iterations"),
                  onChanged: setIteration,
                ),
              ),
            ),
            

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: Text(
                "Result:", 
                style: TextStyle(fontSize: 24)
              ),
            ),
            Expanded(
              flex: 1,
              child:
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          data, 
                          style: const TextStyle(fontSize: 24)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
