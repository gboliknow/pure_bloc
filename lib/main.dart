import 'package:flutter/material.dart';
import 'package:flutter_bloc/counter_bloc.dart';

import 'counter_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc();



  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: StreamBuilder(
          initialData: 0,
          stream:_bloc.counter ,
          builder:(context,snapshot){
            return Column(
     
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${snapshot.data}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        );

          } ,
          )
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              
                  onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
              
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
              FloatingActionButton(
               onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ), 
    );
  }
}
