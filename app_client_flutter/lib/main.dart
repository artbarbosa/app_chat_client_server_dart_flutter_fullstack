import 'package:app_client_flutter/controller.dart';
import 'package:app_client_flutter/src/features/screens/pages/chat_page.dart';
import 'package:app_client_flutter/src/features/screens/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/chat': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return ChatPage(name: args['name'], room: args['room']);
        }
      },
    );
  }
}
