import 'package:flutter/material.dart';
import 'package:signalr_core/signalr_core.dart';
import 'dart:async';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _signalRStatus = 'Unknown';
  HubConnection? hubConnection;
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final connection = HubConnectionBuilder().withUrl(
        'https://rosterinsight.com/communicationService',

        HttpConnectionOptions(

          logging: (level, message) => print(message),
        )).build();
 print("Sikander");
    await connection.start();

   connection.on('notifyUser', (message) {
      print("sikander"+message.toString());
    });

    print("Sikander");

    //await connection.invoke('SendMessage', args: ['Bob', 'Says hi!']);

    /*print( signalR?.isConnected .toString());
   */ /* if (signalR.isConnected ==true) {
      print("connected");
    }*/
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('SignalR'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Connection Status: $_signalRStatus\n',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  /* child: ElevatedButton(
                    onPressed: _buttonTapped, child: Text("Invoke Method")),*/
                )
              ],
            ),
          ),
        )
    );

  }
}


