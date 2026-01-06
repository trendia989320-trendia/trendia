import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _nameController,
      _emailController,
      _passwordController,
      _confirmPasswordController;
  bool _obscurePassword = true,
      _obscureConfirmPassword = true,
      _agreedToTerms = false,
      _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() async {
    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to terms and conditions'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.pushReplacementNamed(context, '/verification');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 253, 253, 253),
              const Color.fromARGB(255, 255, 255, 255)!,
            ],
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
                        const Color.fromARGB(255, 54, 56, 58),
                        const Color.fromARGB(255, 126, 127, 128),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_add_outlined,
                    size: 50,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Create Account',
                  style: AppTypography.heading2.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Join our learning community today',
                  style: AppTypography.subtitle2.copyWith(
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 32),
                _buildTextField(
                  _nameController,
                  'Full Name',
                  'John Doe',
                  Icons.person_outline,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  _emailController,
                  'Email Address',
                  'your@email.com',
                  Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  _passwordController,
                  'Password',
                  'Create a strong password',
                  Icons.lock_outlined,
                  obscureText: _obscurePassword,
                  suffixIcon: _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onSuffixTap: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  _confirmPasswordController,
                  'Confirm Password',
                  'Confirm your password',
                  Icons.lock_outlined,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: _obscureConfirmPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  onSuffixTap: () => setState(
                    () => _obscureConfirmPassword = !_obscureConfirmPassword,
                  ),
                ),
                const SizedBox(height: 24),
                CheckboxListTile(
                  value: _agreedToTerms,
                  onChanged: (value) =>
                      setState(() => _agreedToTerms = value ?? false),
                  tileColor: Colors.black.withOpacity(0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'I agree to ',
                          style: AppTypography.bodySmall.copyWith(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        TextSpan(
                          text: 'Terms',
                          style: AppTypography.bodySmall.copyWith(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' & ',
                          style: AppTypography.bodySmall.copyWith(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy',
                          style: AppTypography.bodySmall.copyWith(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
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
                            'Create Account',
                            style: AppTypography.body.copyWith(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/login'),
                      child: Text(
                        'Login',
                        style: AppTypography.bodySmall.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
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

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String hint,
    IconData prefixIcon, {
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    IconData? suffixIcon,
    VoidCallback? onSuffixTap,
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
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            prefixIcon: Icon(prefixIcon, color: Colors.black.withOpacity(0.7)),
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onSuffixTap,
                    child: Icon(
                      suffixIcon,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  )
                : null,
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
              borderSide: const BorderSide(color: Colors.black, width: 2),
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
