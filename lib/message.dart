import 'package:monapplicationarosaje/page1.dart';
import 'package:flutter/material.dart';
class SendMessagePage extends StatefulWidget {
  @override
  _SendMessagePageState createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  final TextEditingController _messageController = TextEditingController();
  List<Message> _messages = [];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    String messageContent = _messageController.text;
    if (messageContent.isNotEmpty) {
      Message newMessage = Message(
        senderName: 'You',
        senderAvatar: 'https://example.com/your-avatar.jpg',
        content: messageContent,
      );
      setState(() {
        _messages.add(newMessage);
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Envoyer un message'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(message.senderAvatar),
                  ),
                  title: Text(message.senderName),
                  subtitle: Text(message.content),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Entrez votre message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String senderName;
  final String senderAvatar;
  final String content;

  Message({
    required this.senderName,
    required this.senderAvatar,
    required this.content,
  });
}















