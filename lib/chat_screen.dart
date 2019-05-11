import 'package:flutter/material.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  final List<chatMessage> _messages = <chatMessage> [];
  void _handleSubmitted(String text)
  {
    _textController.clear();
    chatMessage message = new chatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: new IconThemeData(color: Colors.teal),
      child: new Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
                child: new TextField(
                  decoration: new InputDecoration.collapsed(hintText: "Enter your Message Here"),
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                ),
            ),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(icon: new Icon(Icons.send), onPressed: () => _handleSubmitted(_textController.text)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_,int index) => _messages[index],
              itemCount: _messages.length,
            )
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
