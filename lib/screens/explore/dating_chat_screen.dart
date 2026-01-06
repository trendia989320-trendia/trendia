import 'package:flutter/material.dart';
import 'dart:ui';
import '../../config/app_theme.dart';

// Dating Chat Screen
class DatingChatScreenV2 extends StatefulWidget {
  final Map<String, dynamic> profile;
  final VoidCallback onClose;

  const DatingChatScreenV2({
    Key? key,
    required this.profile,
    required this.onClose,
  }) : super(key: key);

  @override
  State<DatingChatScreenV2> createState() => _DatingChatScreenV2State();
}

class _DatingChatScreenV2State extends State<DatingChatScreenV2>
    with SingleTickerProviderStateMixin {
  late TextEditingController _messageController;
  late AnimationController _animationController;
  final List<Map<String, dynamic>> _messages = [];

  final List<String> _datingMessages = [
    'Hey! How are you? 😊',
    'Would love to know more about you 💕',
    'What\'s your favorite thing to do?',
    'Let\'s grab coffee sometime ☕',
    'You seem amazing!',
    'I really enjoy talking to you 🥰',
  ];

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.forward();

    // Initial message
    _messages.add({
      'isMe': false,
      'message': 'Hey! Thanks for the rose 🌹',
      'timestamp':
          '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(_animationController),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1a0033), // Dark purple
                  const Color(0xFF330066), // Purple
                  const Color(0xFF660099), // Violet
                  const Color(0xFF990066), // Magenta
                  const Color(0xFFcc3366), // Rose
                  const Color(0xFFff6699), // Pink
                ],
                stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // App Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.onClose();
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.profile['name'],
                                style: AppTypography.subtitle2.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                widget.profile['online']
                                    ? '● Active now'
                                    : '● Active 2h ago',
                                style: AppTypography.captionSmall.copyWith(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.profile['avatar'],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      color: Colors.black.withOpacity(0.1),
                      height: 1,
                    ),
                  ),
                  // Messages
                  Expanded(
                    child: _messages.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '💕',
                                  style: const TextStyle(fontSize: 40),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Start the conversation',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            itemCount: _messages.length,
                            itemBuilder: (context, index) {
                              final msg = _messages[index];
                              return Align(
                                alignment: msg['isMe']
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 10,
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                        0.75,
                                  ),
                                  decoration: BoxDecoration(
                                    color: msg['isMe']
                                        ? Colors.white.withOpacity(0.95)
                                        : Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: msg['isMe']
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        msg['message'],
                                        style: AppTypography.bodySmall.copyWith(
                                          color: msg['isMe']
                                              ? Colors.black87
                                              : Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        msg['timestamp'],
                                        style: AppTypography.captionSmall
                                            .copyWith(
                                              color: msg['isMe']
                                                  ? Colors.grey[700]
                                                  : Colors.white.withOpacity(
                                                      0.6,
                                                    ),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  // Input Area
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border(
                        top: BorderSide(
                          color: Colors.black.withOpacity(0.1),
                          width: 0.5,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: SafeArea(
                      top: false,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                              child: TextField(
                                controller: _messageController,
                                style: AppTypography.bodySmall.copyWith(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Message...',
                                  hintStyle: AppTypography.bodySmall.copyWith(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                ),
                                cursorColor: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
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

                                  Future.delayed(const Duration(seconds: 1), () {
                                    if (mounted) {
                                      final reply =
                                          _datingMessages[DateTime.now()
                                                  .millisecond %
                                              _datingMessages.length];
                                      setState(() {
                                        _messages.add({
                                          'message': reply,
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
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pink[300]!,
                                    Colors.purple[500]!,
                                  ],
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.send_rounded,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




