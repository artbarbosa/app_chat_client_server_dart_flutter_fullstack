import 'package:common/common.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('From json To json', () {
    final json = {
      'name': 'Cleber',
      'room': 'sala 1',
      'text': '',
      'type': 'SocketEventType.enter_room',
    };

    final event = SocketEvent.fromJson(json);
    expect(event.name, 'Cleber');
    expect(event.room, 'sala 1');
    expect(event.text, '');
    expect(event.type, SocketEventType.enter_room);
    expect(event.toJson(), json);
  });
}
