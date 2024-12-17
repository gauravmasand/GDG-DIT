import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

const apikey = "AIzaSyCqagMku4VxFxch9XiHXtUoP9w8WKZTI3A";
//const apikey = 'yK9HFmweSWMnfm8PjMMK6Ll2aXtjo';

class ChatBotPopupButton extends StatelessWidget {
  const ChatBotPopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => ChatBotPopup(),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(
        "Open ChatBot",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class ChatBotPopup extends StatefulWidget {
  @override
  _ChatBotPopupState createState() => _ChatBotPopupState();
}

class _ChatBotPopupState extends State<ChatBotPopup> {
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apikey);
  final List<Messages> _messages = [];
  TextEditingController _userInput = TextEditingController();

  Future<void> sendMessage() async {
    final message = _userInput.text;
    if (message.isEmpty) return;
    setState(() {
      _messages.add(Messages(isUser: true, message: message));
    });
    _userInput.clear();

    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      _messages.add(Messages(isUser: false, message: response.text ?? ""));
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6, // Half size
      minChildSize: 0.4, // Minimum size (collapsed state)
      maxChildSize: 0.9, // Maximum expanded state
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.smart_toy_rounded, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "ChatBot",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: Colors.white))
                  ],
                ),
              ),
              // Chat messages
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.all(10),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return Messages(
                        isUser: message.isUser, message: message.message);
                  },
                ),
              ),
              // Input field
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: _userInput,
                          decoration: InputDecoration(
                            hintText: "Type a message...",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade700,
                      radius: 25,
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: sendMessage,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;

  const Messages({super.key, required this.isUser, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue.shade700 : Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isUser ? Radius.circular(15) : Radius.zero,
            bottomRight: isUser ? Radius.zero : Radius.circular(15),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
              color: isUser ? Colors.white : Colors.black87, fontSize: 15),
        ),
      ),
    );
  }
}
