import 'package:beyanappmobile/screen/lunchhomescreen.dart';
import 'package:beyanappmobile/theme/lunchapptheme.dart';
import 'package:flutter/material.dart';
import 'package:signalr_netcore/signalr_client.dart';

class LoginScreen extends StatefulWidget {
  static const String screenName = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _serverUrl = "http://localhost:64119/chathub";
  HubConnection? _hubConnection;
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  bool connectionIsOpen = false;
  static const String connectionIsOpenPropName = "connectionIsOpen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: LunchApp.bodyColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: LunchApp.bodyColor,
                        radius: 60,
                        child: Image(
                          image: AssetImage('images/login.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to LunchApp!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Login to continue...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                              fontSize: 16),
                        )
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          username = value;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  LunchApp.mainColor)),
                          onPressed: () {
                            if (_formKey.currentState!.validate() == false) {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('Warning'),
                                        content: const Text(
                                            'Username and password are required'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ));
                            } else {
                              login(username, password);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.login),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future login(String username, String password) async {
    await openChatConnection();
    _hubConnection!.invoke("Send", args: <Object>["deneme", "deneme2"]);

    Navigator.pushReplacementNamed(context, LunchHomeScreen.screenName);
  }

  Future<void> openChatConnection() async {
    if (_hubConnection == null) {
      _hubConnection = HubConnectionBuilder().withUrl(_serverUrl).build();

      _hubConnection!.onclose(({error}) => connectionIsOpen = false);
      _hubConnection!.onreconnecting(({error}) {
        print("onreconnecting called");
        connectionIsOpen = false;
      });
      _hubConnection!.onreconnected(({connectionId}) {
        print("onreconnected called");
        connectionIsOpen = true;
      });
      _hubConnection!.on("OnMessage", _handleAClientProvidedFunction);
    }

    if (_hubConnection!.state != HubConnectionState.Connected) {
      await _hubConnection!.start();
      connectionIsOpen = true;
    }
  }

  void _handleAClientProvidedFunction(List<Object>? parameters) {
    print("Server invoked the method");
  }
}
