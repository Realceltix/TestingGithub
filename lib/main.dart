import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CounterPage()
  ));
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
 Color counterColor() {
      if (counter > 0) {
        return Colors.greenAccent;
      }else if (counter < 0) {
        return Colors.redAccent;
      }else {
        return Colors.black;
      }

  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker',
        style: TextStyle(
          color: Colors.green
        ),
        ),
      ),
      body: Center(
          child:   Column(
              children: [
                    Text('Number: $counter',
                    style: TextStyle(
                      fontSize: 35,
                      color: counterColor(),
                    ),
                    ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){
                  print('Elevated Button Pressed');
                }, child: Text('Continue',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                ))
                  ]
                ),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
            setState(() {
              counter++;
            });
          }),
          SizedBox(height: 10,),
          FloatingActionButton(
              child: Icon(Icons.minimize),
              onPressed: (){
            setState(() {
              counter--;
            });
          }),
          SizedBox(height: 10,),
          FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: (){
            setState(() {
              counter = 0;
            });
          })
        ],
      ),
    );
  }
}

