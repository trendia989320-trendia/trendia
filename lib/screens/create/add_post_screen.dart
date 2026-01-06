import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

// ============ ADD POST SCREEN V2 ============
class AddPostScreenV2 extends StatefulWidget {
  const AddPostScreenV2({Key? key}) : super(key: key);

  @override
  State<AddPostScreenV2> createState() => _AddPostScreenV2State();
}

class _AddPostScreenV2State extends State<AddPostScreenV2> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  String _selectedCategory = 'General';
  bool _isPosting = false;

  final List<String> _categories = [
    'General',
    'Technology',
    'Learning',
    'Fun',
    'Art',
    'Music',
    'Travel',
    'Food',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _postContent() async {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isPosting = true);

    // Simulate posting
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isPosting = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Post published successfully! 🎉'),
          backgroundColor: Colors.green[600],
          duration: const Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: AppColors.lightCard,
        elevation: 0,
        title: Text(
          'Create Post',
          style: AppTypography.heading3.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Input
            Text(
              'Title',
              style: AppTypography.subtitle2.copyWith(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: TextField(
                controller: _titleController,
                maxLines: 2,
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter post title...',
                  hintStyle: AppTypography.bodySmall.copyWith(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                cursorColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Description Input
            Text(
              'Description',
              style: AppTypography.subtitle2.copyWith(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: TextField(
                controller: _descriptionController,
                maxLines: 6,
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Share your thoughts...',
                  hintStyle: AppTypography.bodySmall.copyWith(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
                cursorColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Category Selection
            Text(
              'Category',
              style: AppTypography.subtitle2.copyWith(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                isExpanded: true,
                value: _selectedCategory,
                underline: const SizedBox(),
                style: AppTypography.bodySmall.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
                dropdownColor: Colors.black87,
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.black87,
                ),
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedCategory = value);
                  }
                },
              ),
            ),
            const SizedBox(height: 30),

            // Post Button
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: _isPosting ? null : _postContent,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: _isPosting
                          ? [Colors.grey[600]!, Colors.grey[700]!]
                          : [AppColors.periwinkle, AppColors.blueberry],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.periwinkle.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: _isPosting
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Post',
                            style: AppTypography.subtitle2.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}




