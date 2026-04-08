import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.penToSquare, size: 20, color: Color(0xFF1955D1)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        children: [
          _buildChatItem(
            context,
            name: 'Logesh',
            message: 'Thanks bro, see you there!',
            time: '2h',
            avatarText: 'L',
            avatarColor: Colors.blue,
            isPinned: true,
          ),
          _buildChatItem(
            context,
            name: 'Mani',
            message: 'Sent a video.',
            time: '5h',
            avatarText: 'M',
            avatarColor: Colors.green,
          ),
          _buildChatItem(
            context,
            name: 'Lokhi',
            message: 'Hey checking out Namma Oour app.',
            time: '1d',
            avatarText: 'L',
            avatarColor: Colors.orange,
          ),
          _buildChatItem(
            context,
            name: 'Surandhar',
            message: 'Call me later',
            time: '1d',
            avatarText: 'S',
            avatarColor: Colors.blue,
          ),
          _buildChatItem(
            context,
            name: 'Jhonson',
            message: 'Bro eppadi irukka?',
            time: '2d',
            avatarText: 'J',
            avatarColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, {
    required String name,
    required String message,
    required String time,
    required String avatarText,
    required Color avatarColor,
    bool isPinned = false,
  }) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(userName: name)));
      },
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: avatarColor.withOpacity(0.1),
        child: Text(avatarText, style: TextStyle(color: avatarColor, fontWeight: FontWeight.bold)),
      ),
      title: Row(
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (isPinned) ...[
            const SizedBox(width: 8),
            const Icon(FontAwesomeIcons.thumbtack, size: 10, color: Color(0xFF64748B)),
          ],
        ],
      ),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(time, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
