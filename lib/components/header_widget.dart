import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          _buildAvatar(),
          const SizedBox(width: 15),
          _buildGreeting(),
          _buildNotificationButton(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.blue[100],
      child: const Icon(Icons.person, size: 30, color: Colors.blue),
    );
  }

  Widget _buildGreeting() {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, Michael',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            'Where would you like to go?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationButton() {
    return IconButton(
      onPressed: () {
        // TODO: implement notifications
      },
      icon: const Icon(Icons.notifications_outlined),
      iconSize: 28,
    );
  }
} 