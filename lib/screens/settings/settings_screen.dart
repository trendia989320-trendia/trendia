import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../config/app_theme.dart';
import '../../services/theme_service.dart';

// ============ SETTINGS SCREEN V2 ============
class SettingsScreenV2 extends StatefulWidget {
  final VoidCallback? onBack;

  const SettingsScreenV2({Key? key, this.onBack}) : super(key: key);

  @override
  State<SettingsScreenV2> createState() => _SettingsScreenV2State();
}

class _SettingsScreenV2State extends State<SettingsScreenV2> {
  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  bool _privateAccount = false;
  bool _allowMessages = true;
  bool _commentNotifications = true;
  bool _followNotifications = true;
  bool _likeNotifications = true;
  String _selectedLanguage = 'English';
  String _selectedTheme = 'Dark';

  // User profile data
  String _userName = 'John Doe';
  String _userEmail = 'john@example.com';
  String _userBio = 'Learning Enthusiast | Music Lover';
  String _userPhone = '+1 234 567 8900';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      appBar: AppBar(
        backgroundColor: AppColors.lightCard,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            if (widget.onBack != null) {
              widget.onBack!();
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.lightText,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: AppTypography.heading4.copyWith(color: AppColors.lightText),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(color: AppColors.lightBorder, height: 0.5),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Account Section
            _buildSectionHeader('Account'),
            _buildSettingsTile(
              icon: Icons.person_outline,
              title: 'Edit Profile',
              subtitle: 'Update your name, bio, and photo',
              onTap: () => _showEditProfileDialog(context),
            ),
            _buildSettingsTile(
              icon: Icons.email_outlined,
              title: 'Email Address',
              subtitle: _userEmail,
              onTap: () => _showChangeEmailDialog(context),
            ),
            _buildSettingsTile(
              icon: Icons.phone_outlined,
              title: 'Phone Number',
              subtitle: _userPhone,
              onTap: () => _showChangePhoneDialog(context),
            ),
            _buildSettingsTile(
              icon: Icons.lock_outline,
              title: 'Password & Security',
              subtitle: 'Change your password',
              onTap: () => _showChangePasswordDialog(context),
            ),

            // Privacy Section
            _buildSectionHeader('Privacy & Safety'),
            _buildSettingsToggle(
              icon: Icons.lock_rounded,
              title: 'Private Account',
              subtitle: 'Only approved followers can see your posts',
              value: _privateAccount,
              onChanged: (value) {
                setState(() => _privateAccount = value);
                _showSnackBar(context, 'Account privacy updated');
              },
            ),
            _buildSettingsToggle(
              icon: Icons.mail_outline,
              title: 'Allow Messages',
              subtitle: 'Let others send you direct messages',
              value: _allowMessages,
              onChanged: (value) {
                setState(() => _allowMessages = value);
                _showSnackBar(context, 'Message settings updated');
              },
            ),
            _buildSettingsTile(
              icon: Icons.block_outlined,
              title: 'Blocked Users',
              subtitle: 'Manage your blocked users list',
              onTap: () {
                _showSnackBar(context, 'You have 0 blocked users');
              },
            ),

            // Notifications Section
            _buildSectionHeader('Notifications'),
            _buildSettingsToggle(
              icon: Icons.notifications_outlined,
              title: 'All Notifications',
              subtitle: 'Enable or disable all notifications',
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                  if (!value) {
                    _commentNotifications = false;
                    _followNotifications = false;
                    _likeNotifications = false;
                  }
                });
                _showSnackBar(
                  context,
                  _notificationsEnabled
                      ? 'Notifications enabled'
                      : 'Notifications disabled',
                );
              },
            ),
            if (_notificationsEnabled) ...[
              _buildSettingsToggle(
                icon: Icons.favorite_outline,
                title: 'Like Notifications',
                subtitle: 'Get notified when someone likes your post',
                value: _likeNotifications,
                onChanged: (value) {
                  setState(() => _likeNotifications = value);
                  _showSnackBar(context, 'Like notifications updated');
                },
              ),
              _buildSettingsToggle(
                icon: Icons.message_outlined,
                title: 'Comment Notifications',
                subtitle: 'Get notified when someone comments',
                value: _commentNotifications,
                onChanged: (value) {
                  setState(() => _commentNotifications = value);
                  _showSnackBar(context, 'Comment notifications updated');
                },
              ),
              _buildSettingsToggle(
                icon: Icons.person_add_outlined,
                title: 'Follow Notifications',
                subtitle: 'Get notified when someone follows you',
                value: _followNotifications,
                onChanged: (value) {
                  setState(() => _followNotifications = value);
                  _showSnackBar(context, 'Follow notifications updated');
                },
              ),
            ],
            _buildSettingsToggle(
              icon: Icons.volume_up_outlined,
              title: 'Sound',
              subtitle: 'Play notification sounds',
              value: _soundEnabled,
              onChanged: (value) {
                setState(() => _soundEnabled = value);
                _showSnackBar(
                  context,
                  _soundEnabled ? 'Sound enabled' : 'Sound disabled',
                );
              },
            ),

            // Preferences Section
            _buildSectionHeader('Preferences'),
            _buildSettingsDropdown(
              icon: Icons.language_outlined,
              title: 'Language',
              value: _selectedLanguage,
              options: ['English', 'Urdu', 'Hindi', 'Spanish', 'French'],
              onChanged: (value) {
                setState(() => _selectedLanguage = value);
                _showSnackBar(context, 'Language changed to $value');
              },
            ),
            _buildSettingsDropdown(
              icon: Icons.brightness_4_outlined,
              title: 'Theme',
              value: _selectedTheme,
              options: ['Dark', 'Light', 'Auto'],
              onChanged: (value) {
                setState(() => _selectedTheme = value);
                context.read<ThemeService>().setTheme(value);
                _showSnackBar(context, 'Theme changed to $value');
              },
            ),

            // Storage & Data Section
            _buildSectionHeader('Storage & Data'),
            _buildSettingsTile(
              icon: Icons.storage_outlined,
              title: 'Storage Used',
              subtitle: 'App takes 245 MB of storage',
              onTap: () {
                _showSnackBar(context, 'Cache cleared successfully');
              },
            ),
            _buildSettingsTile(
              icon: Icons.download_outlined,
              title: 'Download Quality',
              subtitle: 'Currently set to High',
              onTap: () => _showDownloadQualityDialog(context),
            ),

            // About Section
            _buildSectionHeader('About'),
            _buildSettingsTile(
              icon: Icons.info_outline,
              title: 'About App',
              subtitle: 'Learn Mitra v1.0.0 (Build 42)',
              onTap: () => _showAboutDialog(context),
            ),
            _buildSettingsTile(
              icon: Icons.file_copy_outlined,
              title: 'Terms & Conditions',
              subtitle: 'Review our terms of service',
              onTap: () {
                _showSnackBar(context, 'Terms & Conditions opened');
              },
            ),
            _buildSettingsTile(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              subtitle: 'Review our privacy policy',
              onTap: () {
                _showSnackBar(context, 'Privacy Policy opened');
              },
            ),
            _buildSettingsTile(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'Get help or report an issue',
              onTap: () => _showHelpDialog(context),
            ),
            _buildSettingsTile(
              icon: Icons.feedback_outlined,
              title: 'Send Feedback',
              subtitle: 'Share your feedback with us',
              onTap: () => _showFeedbackDialog(context),
            ),

            // Danger Zone
            _buildSectionHeader('Danger Zone'),
            _buildSettingsTile(
              icon: Icons.logout_outlined,
              title: 'Log Out',
              subtitle: 'Sign out of your account',
              isDestructive: true,
              onTap: () => _showLogoutDialog(context),
            ),
            _buildSettingsTile(
              icon: Icons.delete_outline,
              title: 'Delete Account',
              subtitle: 'Permanently delete your account',
              isDestructive: true,
              onTap: () => _showDeleteAccountDialog(context),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isDestructive
                    ? Colors.red.withOpacity(0.15)
                    : Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isDestructive ? Colors.red[400] : Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      color: isDestructive ? Colors.red[400] : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.outfit(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: Colors.black87, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsToggle({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.black,
            activeTrackColor: Colors.black.withOpacity(0.3),
            inactiveTrackColor: Colors.black87,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsDropdown({
    required IconData icon,
    required String title,
    required String value,
    required List<String> options,
    required Function(String) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                DropdownButton<String>(
                  value: value,
                  onChanged: (newValue) {
                    if (newValue != null) {
                      onChanged(newValue);
                    }
                  },
                  dropdownColor: Colors.black87,
                  underline: const SizedBox(),
                  isDense: true,
                  items: options.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(
                        option,
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Icon(Icons.expand_more_rounded, color: Colors.black87, size: 20),
        ],
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    final nameController = TextEditingController(text: _userName);
    final bioController = TextEditingController(text: _userBio);

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Profile',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              _buildDialogTextField('Name', nameController),
              const SizedBox(height: 12),
              _buildDialogTextField('Bio', bioController, maxLines: 3),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.outfit(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _userName = nameController.text;
                          _userBio = bioController.text;
                        });
                        Navigator.of(dialogContext).pop();
                        _showSnackBar(context, 'Profile updated successfully');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChangeEmailDialog(BuildContext context) {
    final emailController = TextEditingController(text: _userEmail);

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change Email',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              _buildDialogTextField('New Email', emailController),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.outfit(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => _userEmail = emailController.text);
                        Navigator.of(dialogContext).pop();
                        _showSnackBar(context, 'Email updated successfully');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChangePhoneDialog(BuildContext context) {
    final phoneController = TextEditingController(text: _userPhone);

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change Phone Number',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              _buildDialogTextField('Phone Number', phoneController),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.outfit(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => _userPhone = phoneController.text);
                        Navigator.of(dialogContext).pop();
                        _showSnackBar(
                          context,
                          'Phone number updated successfully',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change Password',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              _buildDialogTextField(
                'Current Password',
                oldPasswordController,
                obscure: true,
              ),
              const SizedBox(height: 12),
              _buildDialogTextField(
                'New Password',
                newPasswordController,
                obscure: true,
              ),
              const SizedBox(height: 12),
              _buildDialogTextField(
                'Confirm Password',
                confirmPasswordController,
                obscure: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.outfit(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (newPasswordController.text !=
                            confirmPasswordController.text) {
                          _showSnackBar(context, 'Passwords do not match');
                        } else {
                          Navigator.of(dialogContext).pop();
                          _showSnackBar(
                            context,
                            'Password changed successfully',
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Change',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDownloadQualityDialog(BuildContext context) {
    String selectedQuality = 'High';

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Download Quality',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16),
                _buildQualityOption(
                  'Low',
                  'Faster, Less Data',
                  selectedQuality,
                  (val) {
                    setState(() => selectedQuality = val);
                  },
                ),
                _buildQualityOption('Medium', 'Balanced', selectedQuality, (
                  val,
                ) {
                  setState(() => selectedQuality = val);
                }),
                _buildQualityOption('High', 'Best Quality', selectedQuality, (
                  val,
                ) {
                  setState(() => selectedQuality = val);
                }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.outfit(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          _showSnackBar(
                            context,
                            'Download quality set to $selectedQuality',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Save',
                          style: GoogleFonts.outfit(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQualityOption(
    String label,
    String subtitle,
    String selectedQuality,
    Function(String) onSelect,
  ) {
    return GestureDetector(
      onTap: () => onSelect(label),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Radio<String>(
              value: label,
              groupValue: selectedQuality,
              onChanged: (val) => onSelect(val!),
              activeColor: Colors.black,
              fillColor: MaterialStateProperty.all(Colors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info_rounded, color: Colors.black, size: 48),
              const SizedBox(height: 16),
              Text(
                'Learn Mitra',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Version 1.0.0 (Build 42)',
                style: GoogleFonts.outfit(color: Colors.black87, fontSize: 13),
              ),
              const SizedBox(height: 16),
              Text(
                'A music learning platform designed to make learning fun and interactive. Connect with other learners and grow together!',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(color: Colors.black, fontSize: 13),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 44),
                ),
                child: Text(
                  'Close',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help & Support',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              _buildHelpItem(
                'How to edit my profile?',
                'Go to Settings > Edit Profile to update your information',
              ),
              const SizedBox(height: 12),
              _buildHelpItem(
                'How to create a post?',
                'Tap the + icon and select your content type',
              ),
              const SizedBox(height: 12),
              _buildHelpItem(
                'How to message someone?',
                'Go to their profile and tap the message icon',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 44),
                ),
                child: Text(
                  'Close',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    final feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send Feedback',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              _buildDialogTextField(
                'Your feedback',
                feedbackController,
                maxLines: 4,
                hintText: 'Tell us what you think...',
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.outfit(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        _showSnackBar(context, 'Thank you for your feedback!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Send',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout_rounded, color: Colors.red[400], size: 40),
              const SizedBox(height: 16),
              Text(
                'Log Out?',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to log out?',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(color: Colors.black87, fontSize: 13),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        _showSnackBar(context, 'Logged out successfully');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.delete_forever_rounded,
                color: Colors.red[400],
                size: 40,
              ),
              const SizedBox(height: 16),
              Text(
                'Delete Account?',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'This action cannot be undone. All your data will be permanently deleted.',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(color: Colors.black87, fontSize: 13),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        _showSnackBar(context, 'Account deletion initiated');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'Delete Account',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    bool obscure = false,
    String? hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          maxLines: maxLines,
          style: GoogleFonts.outfit(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.outfit(color: Colors.black87),
            filled: true,
            fillColor: Colors.black87,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHelpItem(String question, String answer) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            answer,
            style: GoogleFonts.outfit(
              color: Colors.black87,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.outfit()),
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
