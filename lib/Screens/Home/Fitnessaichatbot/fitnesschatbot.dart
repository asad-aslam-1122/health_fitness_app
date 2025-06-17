import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../Core/apiconfig.dart';

class FitnessChatScreen extends StatefulWidget {
  const FitnessChatScreen({super.key});

  @override
  FitnessChatScreenState createState() => FitnessChatScreenState();
}

class FitnessChatScreenState extends State<FitnessChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  bool isLoading = false;

  Future<void> sendMessage() async {
    String userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      messages.add({"role": "user", "text": userMessage});
      isLoading = true;
    });

    _controller.clear();

    String? botResponse = await fetchFitnessResponse(userMessage);

    setState(() {
      messages.add({
        "role": "bot",
        "text": botResponse ?? "Sorry, I couldn't process your fitness question."
      });
      isLoading = false;
    });
  }

  Future<String?> fetchFitnessResponse(String prompt) async {
    final Uri url = Uri.parse("https://api.groq.com/openai/v1/chat/completions");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey"
        },
        body: jsonEncode({
          "messages": [
            {
              "role": "system",
              "content": "You are a helpful AI fitness assistant. Provide concise, accurate, and practical advice for fitness-related questions. Include exercise tips, nutrition advice, and workout plans when appropriate."
            },
            {
              "role": "user",
              "content": prompt
            }
          ],
          "model": "llama3-70b-8192",
          "temperature": 0.7,
          "max_tokens": 1024,
          "top_p": 1,
          "stream": false,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse["choices"]?[0]["message"]["content"];
      } else {
        debugPrint("API Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      debugPrint("Error fetching response: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness AI Assistant",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                bool isUser = msg["role"] == "user";
                return ChatBubble(text: msg["text"]!, isUser: isUser);
              },
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: Colors.blue),
            ),
          MessageInputField(controller: _controller, sendMessage: sendMessage),
        ],
      ),
    );
  }
}

// Chat Bubble Widget
class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  const ChatBubble({required this.text, required this.isUser, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: isUser ? Colors.deepPurple : Colors.blueGrey[800],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isUser ? 16 : 0),
            topRight: Radius.circular(isUser ? 0 : 16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

// Message Input Field Widget
class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback sendMessage;
  const MessageInputField({required this.controller, required this.sendMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        border: Border(
          top: BorderSide(color: Colors.grey.shade700, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                hintText: "Ask a fitness question...",
                hintStyle: GoogleFonts.poppins(color: Colors.white54),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                filled: true,
                fillColor: Colors.grey[800],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
              onSubmitted: (value) => sendMessage(),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: sendMessage,
            child: const CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 25,
              child: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}