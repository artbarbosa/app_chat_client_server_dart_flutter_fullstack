import 'package:app_client_flutter/src/features/screens/controllers/chat_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.name, required this.room})
      : super(key: key);

  final String name;
  final String room;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatController controller;

  @override
  void initState() {
    super.initState();
    controller = ChatController(widget.room, widget.name);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Room: ${widget.room}"),
      ),
      extendBody: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            RxBuilder(builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.listEvents.length,
                  itemBuilder: (_, id) {
                    final event = controller.listEvents[id];

                    if (event.type == SocketEventType.enter_room) {
                      return Text('${event.name} Entrou na sala');
                    } else if (event.type == SocketEventType.leave_room) {
                      return Text('${event.name} Saiu na sala');
                    }
                    return ListTile(
                      title: Text(event.name),
                      subtitle: Text(event.text),
                    );
                  },
                ),
              );
            }),
            TextField(
              focusNode: controller.focusNode,
              onSubmitted: (_) => controller.send(),
              controller: controller.textController,
              decoration: InputDecoration(
                hintText: 'Type your text',
                suffixIcon: IconButton(
                    onPressed: controller.send,
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
