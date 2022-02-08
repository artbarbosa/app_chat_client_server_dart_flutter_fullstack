import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'NoName';
  String room = 'any';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) => room = value,
                decoration: const InputDecoration(labelText: 'Room'),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) => name = value,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/chat', arguments: {
                      'room': room,
                      'name': name,
                    });
                  },
                  child: const Text('Start Chat'))
            ],
          ),
        ),
      ),
    );
  }
}
