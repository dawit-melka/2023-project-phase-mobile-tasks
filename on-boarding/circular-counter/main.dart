import 'package:flutter/material.dart';

void main() {
  runApp(CircularCounterApp());
}

class CircularCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1A1A1A),
      ),
      home: CircularCounterScreen(),
    );
  }
}

class CircularCounterScreen extends StatefulWidget {
  @override
  _CircularCounterScreenState createState() => _CircularCounterScreenState();
}

class _CircularCounterScreenState extends State<CircularCounterScreen> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter = (counter + 1) % 11; // Circular range: 0 to 10
    });
  }

  void _decrementCounter() {
    setState(() {
      counter = (counter - 1 + 11) % 11; // Circular range: 0 to 10
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Text(
                '$counter',
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Increment',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Decrement',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
