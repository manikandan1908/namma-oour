import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatelessWidget {
  final String userName;
  const ChatScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue.withOpacity(0.1),
              child: Text(userName[0], style: const TextStyle(color: Colors.blue, fontSize: 14)),
            ),
            const SizedBox(width: 12),
            Text(userName, style: const TextStyle(fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.phone, size: 18, color: Color(0xFF1955D1)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildMessageBubble(
                  context,
                  message: 'Hey, Namma Oour app eppadi varudhu?',
                  isMe: false,
                ),
                _buildMessageBubble(
                  context,
                  message: 'Super aa poitu irukku bro! Features mass aa irukku. 🔥',
                  isMe: true,
                ),
              ],
            ),
          ),
          _buildChatInput(context),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(BuildContext context, {required String message, required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF1955D1) : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isMe ? Colors.white : const Color(0xFF1E293B),
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildChatInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.plus, size: 18, color: Color(0xFF64748B)),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Message...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Icon(FontAwesomeIcons.microphone, size: 18, color: Color(0xFF64748B)),
        ],
      ),
    );
  }
}
