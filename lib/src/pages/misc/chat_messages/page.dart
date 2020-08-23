import 'dart:math';

import 'package:flutter/material.dart';

import 'chat.service.dart';
import 'message.dart';
import 'user.dart';

class ChatMessaagesPage extends StatefulWidget {
  static final String path = "lib/src/pages/misc/chat_messages/page.dart";
  @override
  _ChatMessaagesPageState createState() => _ChatMessaagesPageState();
}

class _ChatMessaagesPageState extends State<ChatMessaagesPage> {
  final rand = Random();
  final ChatService _service = ChatService();
  final FocusNode _focusNode = FocusNode();
  TextEditingController _controller;

  bool canSave = false;
  List<Message> messages;
  List<User> users;
  User currentUser;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      var _canSave = _controller.text.isNotEmpty;
      if (_canSave != canSave) {
        canSave = _canSave;
        setState(() {});
      }
    });
    messages = _service.getMessages();
    users = _service.getUsers();
    currentUser = _service.getUser(1);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              reverse: true,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (_, __) => _hbox10,
              itemCount: messages.length,
              itemBuilder: (_, i) {
                var msg = messages[i];
                return msg.userId == currentUser.id ? _msgForCurrent(msg) : _msgForOther(msg);
              },
            ),
          ),
          _bottomBar,
        ],
      ),
    );
  }

  Widget get _bottomBar {
    return Container(
      margin: _insetsH16V8,
      decoration: _bottomBarDecoration,
      padding: _insetsH20V8,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: _controller,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                contentPadding: _insetsH20V10,
                border: _circularOutlineInputBorder,
                hintText: "Message ...",
              ),
              onEditingComplete: _save,
              //onSubmitted: _save,
            ),
          ),
          IconButton(
            icon: _sendIcon,
            color: Theme.of(context).primaryColor,
            onPressed: _save,
          ),
        ],
      ),
    );
  }

  Widget _msgForCurrent(Message msg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _wbox30,
        Container(
          padding: _insetsH16V8,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: _circularBorder10,
          ),
          child: Text(msg.message, style: _whiteS18Style),
        ),
        _wbox5,
        CircleAvatar(
          backgroundImage: NetworkImage(currentUser.image),
          radius: 10,
        ),
        _wbox20,
      ],
    );
  }

  Widget _msgForOther(Message msg) {
    User user = _service.getUser(msg.userId);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _wbox20,
        CircleAvatar(
          backgroundImage: NetworkImage(user.image),
          radius: 20,
        ),
        _wbox5,
        Container(
          padding: _insetsH16V8,
          decoration: _otherMessageDecoration,
          child: Text(msg.message, style: _blackS18Style),
        ),
        _wbox30,
      ],
    );
  }

  void _save() async {
    if (_controller.text.isEmpty) return;
    print('Save');
    //FocusScope.of(context).requestFocus(FocusNode());
    _focusNode.unfocus();
    //var userId = 1;
    var userId = rand.nextInt(users.length) + 1;
    var message = _controller.text;
    var msg = _service.addMessage(userId, message);
    _controller.clear();
    //messages = [msg, ...messages];
    messages = _service.getMessages();
    //messages.insert(0, msg);
    setState(() {});
  }

  final _wbox5 = SizedBox(width: 5);
  final _wbox20 = SizedBox(width: 20);
  final _wbox30 = SizedBox(width: 30);
  final _hbox10 = SizedBox(height: 10);

  final _insetsH16V8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  final _insetsH20V8 = EdgeInsets.symmetric(horizontal: 20, vertical: 8);
  final _insetsH20V10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  final _whiteS18Style = TextStyle(color: Colors.white, fontSize: 18);
  final _blackS18Style = TextStyle(color: Colors.black, fontSize: 18);

  final _circularBorder10 = BorderRadius.circular(10);

  final _bottomBarDecoration = BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(30),
  );
  final _otherMessageDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

  final _sendIcon = Icon(Icons.send);

  final _circularOutlineInputBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(20));
}
