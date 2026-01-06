import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

// ============ SETUP PROFILE SCREEN (Updated with gradient) ============
class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({Key? key}) : super(key: key);

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  String? _selectedAvatar;
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  bool _isLoading = false;

  final List<String> _avatars = ['👨', '👩', '👨‍🦰', '👩‍🦰', '🧔', '👩‍🦱'];

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _bioController = TextEditingController();
    _selectedAvatar = _avatars[0];
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _handleComplete() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF4D648D),
                        const Color(0xFFD0E1F9),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_outline_outlined,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Set Up Your Profile',
                  style: AppTypography.heading2.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Make your profile stand out',
                  style: AppTypography.subtitle2.copyWith(
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Choose Your Avatar',
                  style: AppTypography.body.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _avatars.map((avatar) {
                    final isSelected = _selectedAvatar == avatar;
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedAvatar = avatar);
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.learnColor.withOpacity(0.3)
                              : Colors.white.withOpacity(0.05),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.learnColor
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            avatar,
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),
                _buildTextField(
                  controller: _usernameController,
                  label: 'Username',
                  hint: '@yourname',
                  prefixIcon: Icons.person_outline,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _bioController,
                  label: 'Bio',
                  hint: 'Tell us about yourself',
                  prefixIcon: Icons.info_outline,
                  maxLines: 3,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleComplete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.learnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(
                            'Complete Setup',
                            style: AppTypography.body.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData prefixIcon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.body.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            prefixIcon: Icon(prefixIcon, color: Colors.black.withOpacity(0.7)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.learnColor,
                width: 2,
              ),
            ),
            filled: true,
            fillColor: Colors.black.withOpacity(0.05),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}




