library common;

const String API_URL = 'http://dart-socket.herokuapp.com/';

class SocketEvent {
  final String name;
  final String room;
  final String text;
  final SocketEventType type;

  SocketEvent(
      {required this.name,
      required this.room,
      this.text = '',
      required this.type,
      s});

  Map toJson() {
    return {
      'name': name,
      'room': room,
      'text': text,
      'type': type.toString(),
    };
  }

  factory SocketEvent.fromJson(Map json) {
    return SocketEvent(
      name: json['name'],
      room: json['room'],
      text: json['text'],
      type: SocketEventType.values
          .firstWhere((element) => element.toString() == json['type']),
    );
  }
}

enum SocketEventType { enter_room, leave_room, message }
