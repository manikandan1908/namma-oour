import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeFeedView(),
    const MessagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: const Color(0xFF1955D1),
          unselectedItemColor: const Color(0xFF64748B),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.message),
              label: 'Messages',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1955D1),
        shape: const CircleBorder(),
        child: const Icon(FontAwesomeIcons.plus, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeFeedView extends StatelessWidget {
  const HomeFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(text: 'Namma '),
              TextSpan(text: 'Oour', style: TextStyle(color: Color(0xFFEF3D56))),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.circleUser, size: 24),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
          _buildPostCard(
            context,
            user: 'Dinakaran Daily',
            avatarText: 'D',
            avatarColor: Colors.blue,
            tag: 'Breaking News',
            time: '2h ago',
            content: 'Tamil Nadu updates: Heavy rains expected in coastal districts tomorrow. Stay safe!',
            imageUrl: 'https://images.unsplash.com/photo-1584483766114-2cea6facdf57?auto=format&fit=crop&q=80&w=400&h=200',
          ),
          const SizedBox(height: 16),
          _buildPostCard(
            context,
            user: 'Sports Now',
            avatarText: 'S',
            avatarColor: Colors.green,
            tag: 'Sports News',
            time: '5h ago',
            content: 'Thrilling match tonight! India secures a massive win in the T20 final match. 🏏🔥',
            imageUrl: 'https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?auto=format&fit=crop&q=80&w=400&h=200',
          ),
          const SizedBox(height: 16),
          _buildSuggestionCard(
            context,
            user: 'Suresh Velan',
            avatarText: 'S',
            avatarColor: Colors.orange,
            mutuals: '5 mutual friends',
          ),
          const SizedBox(height: 100), // Space for bottom nav
        ],
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, {
    required String user,
    required String avatarText,
    required Color avatarColor,
    required String tag,
    required String time,
    required String content,
    String? imageUrl,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: avatarColor.withOpacity(0.1),
              child: Text(avatarText, style: TextStyle(color: avatarColor, fontWeight: FontWeight.bold)),
            ),
            title: Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('$time • $tag', style: const TextStyle(fontSize: 12)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(content),
          ),
          if (imageUrl != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.thumbsUp, size: 16, color: Color(0xFF64748B)),
                  label: const Text('Like', style: TextStyle(color: Color(0xFF64748B))),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.comment, size: 16, color: Color(0xFF64748B)),
                  label: const Text('Comment', style: TextStyle(color: Color(0xFF64748B))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard(BuildContext context, {
    required String user,
    required String avatarText,
    required Color avatarColor,
    required String mutuals,
  }) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF1F5FD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: avatarColor.withOpacity(0.1),
              child: Text(avatarText, style: TextStyle(color: avatarColor, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(mutuals, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1955D1),
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              child: const Text('Link', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
