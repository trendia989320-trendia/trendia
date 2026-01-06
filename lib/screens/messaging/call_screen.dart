import 'package:flutter/material.dart';

// iOS-Like Calling Screen
class CallScreenV2 extends StatefulWidget {
  final Map<String, dynamic> user;
  final bool isVideo;

  const CallScreenV2({Key? key, required this.user, this.isVideo = false})
    : super(key: key);

  @override
  State<CallScreenV2> createState() => _CallScreenV2State();
}

class _CallScreenV2State extends State<CallScreenV2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _callDuration = 0;
  bool _isMuted = false;
  bool _isLoudspeaker = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    // Simulate call timer
    Future.delayed(const Duration(seconds: 1), _startCallTimer);
  }

  void _startCallTimer() {
    if (mounted) {
      setState(() => _callDuration++);
      Future.delayed(const Duration(seconds: 1), _startCallTimer);
    }
  }

  String _formatDuration(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '$mins:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1a1f3a),
              const Color(0xFF16213e),
              const Color(0xFF0f3460),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Profile Section
              Column(
                children: [
                  // Profile Avatar
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.user['avatar'],
                        style: const TextStyle(fontSize: 60),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Name
                  Text(
                    widget.user['name'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Call Status with Animation
                  if (_callDuration == 0)
                    ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.8,
                        end: 1.2,
                      ).animate(_animationController),
                      child: Text(
                        'Calling...',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                      ),
                    )
                  else
                    Text(
                      _formatDuration(_callDuration),
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
              const Spacer(flex: 3),
              // Control Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Mute Button
                  GestureDetector(
                    onTap: () => setState(() => _isMuted = !_isMuted),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isMuted
                            ? Colors.grey[700]
                            : Colors.white.withOpacity(0.1),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        _isMuted ? Icons.mic_off : Icons.mic_none,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  // Loudspeaker Button
                  GestureDetector(
                    onTap: () =>
                        setState(() => _isLoudspeaker = !_isLoudspeaker),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isLoudspeaker
                            ? Colors.grey[700]
                            : Colors.white.withOpacity(0.1),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        _isLoudspeaker ? Icons.speaker_phone : Icons.volume_up,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  // End Call Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red[600],
                      ),
                      child: const Icon(
                        Icons.call_end_rounded,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}




