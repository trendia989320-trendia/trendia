import 'package:flutter/material.dart';
import '../../config/app_theme.dart';
import 'call_screen.dart';

// ============ CHAT DETAIL SCREEN ============
class ChatDetailScreenV2 extends StatefulWidget {
  final Map<String, dynamic> chat;

  const ChatDetailScreenV2({Key? key, required this.chat}) : super(key: key);

  @override
  State<ChatDetailScreenV2> createState() => _ChatDetailScreenV2State();
}

class _ChatDetailScreenV2State extends State<ChatDetailScreenV2> {
  late TextEditingController _messageController;

  final List<Map<String, dynamic>> _messages = [
    {'isMe': false, 'message': 'Hey! How are you? 👋', 'timestamp': '10:30 AM'},
    {
      'isMe': true,
      'message': 'Hey! I\'m doing great! How about you?',
      'timestamp': '10:31 AM',
    },
    {
      'isMe': false,
      'message': 'Pretty good! Just finished a new project 🎉',
      'timestamp': '10:32 AM',
    },
    {
      'isMe': false,
      'message': 'Would love to hear your thoughts on it',
      'timestamp': '10:32 AM',
    },
    {
      'isMe': true,
      'message': 'That\'s amazing! Tell me more about it 📱',
      'timestamp': '10:33 AM',
    },
    {
      'isMe': false,
      'message': 'It\'s a Flutter app with dark theme and amazing UI 🚀',
      'timestamp': '10:34 AM',
    },
    {
      'isMe': true,
      'message': 'Wow! Sounds incredible! Can I check it out?',
      'timestamp': '10:35 AM',
    },
    {
      'isMe': false,
      'message': 'Sure! Let\'s have a video call to discuss it',
      'timestamp': '10:36 AM',
    },
    {
      'isMe': true,
      'message': 'Perfect! When are you free?',
      'timestamp': '10:37 AM',
    },
    {
      'isMe': false,
      'message': 'How about tomorrow at 3 PM?',
      'timestamp': '10:38 AM',
    },
    {
      'isMe': true,
      'message': 'Sounds good! See you then! 😊',
      'timestamp': '10:39 AM',
    },
  ];

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: AppColors.lightCard,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chat['name'],
              style: AppTypography.subtitle2.copyWith(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.chat['online'] ? 'Active now' : 'Active 2h ago',
              style: AppTypography.captionSmall.copyWith(
                color: Colors.black87,
                fontSize: 11,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallScreenV2(user: widget.chat),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CallScreenV2(user: widget.chat, isVideo: true),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment: msg['isMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: msg['isMe'] ? Colors.white : Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: msg['isMe']
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg['message'],
                          style: AppTypography.bodySmall.copyWith(
                            color: msg['isMe'] ? Colors.black : Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg['timestamp'],
                          style: AppTypography.captionSmall.copyWith(
                            color: Colors.black87,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Input Field
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(
                top: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                      size: 26,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: TextField(
                        controller: _messageController,
                        style: AppTypography.bodySmall.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          hintText: 'type something...',
                          hintStyle: AppTypography.bodySmall.copyWith(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(
                      Icons.send_rounded,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 22,
                    ),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {
                        final now = DateTime.now();
                        final timeStr =
                            '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
                        setState(() {
                          _messages.add({
                            'message': _messageController.text,
                            'timestamp': timeStr,
                            'isMe': true,
                          });
                          _messageController.clear();
                          // Add demo reply after 1 second
                          Future.delayed(const Duration(seconds: 1), () {
                            if (mounted) {
                              final demoReplies = [
                                'Haha, that\'s awesome! 😄',
                                'Tell me more!',
                                'I totally agree with you! 👍',
                                'That\'s amazing bro! 🔥',
                                'Haan bilkul! Let\'s meet soon!',
                              ];
                              final random =
                                  demoReplies[DateTime.now().millisecond %
                                      demoReplies.length];
                              setState(() {
                                _messages.add({
                                  'message': random,
                                  'timestamp':
                                      '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
                                  'isMe': false,
                                });
                              });
                            }
                          });
                        });
                      }
                    },
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




