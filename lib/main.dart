import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
    ChangeNotifierProvider<AnimatedProvider>.value(value: AnimatedProvider()),
        ],
        child: MaterialWidget(),
    );
  }
}

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AnimatedProvider _state = Provider.of<AnimatedProvider>(context);
    return MaterialApp(
      title: 'Provider Homework',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Homework', style: TextStyle(color: _state._colorTitle)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: _state._size,
                width: _state._size,
                color: _state._color,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Scale AnimatedContainer'),
                onPressed: _state.changeSize,
              ),
              const SizedBox(height: 10),
               Switch(
                    onChanged: (bool value) {
                    _state.changeColor(value);
                    },
                    value: _state.isSwitched,
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class  AnimatedProvider extends ChangeNotifier {
  final random = Random();
  Color _color = Colors.green;
  Color _colorTitle = Colors.red;
  bool isSwitched = false;
  double _size = 150;

  void changeColor(bool value) {
    isSwitched = value;
    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    _colorTitle = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    notifyListeners();
  }
  void changeSize(){
  _size = _size == 150 ? 50 : 150;
  notifyListeners();
}
}



