import 'package:flutter_ui_challenges/core/constants.dart';

import 'user.dart';
import 'message.dart';

class ChatService {
  int _msgId = 8;

  List<Message> _messages = [
    Message(id: 1, userId: 1, message: "Hello,"),
    Message(id: 2, userId: 1, message: "How are you today?"),
    Message(id: 3, userId: 2, message: "Hi,"),
    Message(id: 4, userId: 2, message: "I am fine, thank you. How are you?"),
    Message(id: 5, userId: 1, message: "I am good too"),
    Message(id: 6, userId: 2, message: "Are you going to market today?"),
    Message(id: 7, userId: 1, message: "I suppose I am."),
    Message(id: 8, userId: 1, message: "But I may not go if the weather is bad."),
  ];

  List<User> _users = [
    User(
      id: 1,
      name: 'John',
      image: '$STORE_BASE_URL/img%2F7.jpg?alt=media',
    ),
    User(
      id: 2,
      name: 'Mary',
      image: '$STORE_BASE_URL/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
    ),
  ];

  List<User> getUsers() {
    return [..._users];
  }

  User getUser(int id) {
    return _users.firstWhere((x) => x.id == id, orElse: () => null);
  }

  List<Message> getMessages() {
    return [..._messages];
  }

  Message getMessage(int id) {
    return _messages.firstWhere((x) => x.id == id, orElse: () => null);
  }

  List<Message> getMessagesForUser(int id) {
    return _messages.where((x) => x.userId == id);
  }

  Message addMessage(int userId, String message) {
    var msg = Message(id: ++_msgId, userId: userId, message: message);
    _messages.add(msg);
    return msg;
  }
}
