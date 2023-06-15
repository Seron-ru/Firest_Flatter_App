import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _leftPosition = 0.0;
  bool _isAnimating = false;

  void _moveLeft() {
    if (!_isAnimating && _leftPosition > 0) {
      setState(() {
        _isAnimating = true;
        _leftPosition = 0;
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _isAnimating = false;
        });
      });
    }
  }

  void _moveRight() {
    if (!_isAnimating && _leftPosition < MediaQuery.of(context).size.width - 100) {
      setState(() {
        _isAnimating = true;
        _leftPosition = MediaQuery.of(context).size.width - 100;
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _isAnimating = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Square'),
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: _leftPosition,
              top: 100,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: ElevatedButton(
                onPressed: _isAnimating ? null : _moveLeft,
                child: Text('Влево'),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: ElevatedButton(
                onPressed: _isAnimating ? null : _moveRight,
                child: Text('Вправо'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}