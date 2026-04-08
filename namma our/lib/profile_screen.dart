import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1955D1), Color(0xFFEF3D56)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Icon(FontAwesomeIcons.camera, color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(height: 70, color: Colors.transparent),
                    Positioned(
                      top: -110,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFFCBD5E1),
                          child: Icon(FontAwesomeIcons.user, size: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'User Name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '9 Linked People • 5 posts',
                  style: TextStyle(color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                      context,
                      label: 'Add to story',
                      icon: FontAwesomeIcons.plus,
                      isPrimary: true,
                    ),
                    const SizedBox(width: 12),
                    _buildActionButton(
                      context,
                      label: 'Edit profile',
                      icon: FontAwesomeIcons.pen,
                      isPrimary: false,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildPostsSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, {required String label, required IconData icon, required bool isPrimary}) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 14),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? const Color(0xFF1955D1) : Colors.white,
        foregroundColor: isPrimary ? Colors.white : const Color(0xFF1E293B),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: isPrimary ? BorderSide.none : const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  Widget _buildPostsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your Posts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: CircleAvatar(child: Text('U')),
                  title: Text('User Name', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Yesterday'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('King Kohli! What a massive innings. Masterclass batting. 👑🔥💯'),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1593341646782-e0b495cff86d?auto=format&fit=crop&q=80&w=400&h=300',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.thumbsUp, size: 16, color: Color(0xFF1955D1)),
                      SizedBox(width: 8),
                      Text('1.2K', style: TextStyle(color: Color(0xFF1955D1))),
                      SizedBox(width: 24),
                      Icon(FontAwesomeIcons.comment, size: 16, color: Color(0xFF64748B)),
                      SizedBox(width: 8),
                      Text('450', style: TextStyle(color: Color(0xFF64748B))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
