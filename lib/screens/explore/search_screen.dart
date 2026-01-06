import 'package:flutter/material.dart';
import '../../config/app_theme.dart';

// ============ SEARCH SCREEN V2 ============
class SearchScreenV2 extends StatefulWidget {
  const SearchScreenV2({Key? key}) : super(key: key);

  @override
  State<SearchScreenV2> createState() => _SearchScreenV2State();
}

class _SearchScreenV2State extends State<SearchScreenV2> {
  late TextEditingController _searchController;
  List<String> _filteredResults = [];
  bool _hasSearched = false;

  final List<Map<String, dynamic>> _allItems = [
    {'title': 'Web Development', 'icon': Icons.code_outlined},
    {'title': 'Mobile Apps', 'icon': Icons.phone_android_outlined},
    {'title': 'UI Design', 'icon': Icons.design_services_outlined},
    {'title': 'Python Basics', 'icon': Icons.school_outlined},
    {'title': 'JavaScript Tips', 'icon': Icons.lightbulb_outline},
    {'title': 'Flutter', 'icon': Icons.auto_awesome_outlined},
    {'title': 'Crypto', 'icon': Icons.trending_up_outlined},
    {'title': 'Freelancing', 'icon': Icons.work_outline},
    {'title': 'Data Science', 'icon': Icons.analytics_outlined},
    {'title': 'DevOps', 'icon': Icons.cloud_done_outlined},
    {'title': 'Community', 'icon': Icons.people_outline},
    {'title': 'Resources', 'icon': Icons.library_books_outlined},
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredResults = _allItems
        .map((item) => item['title'] as String)
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _hasSearched = query.isNotEmpty;
      if (query.isEmpty) {
        _filteredResults = _allItems
            .map((item) => item['title'] as String)
            .toList();
      } else {
        _filteredResults = _allItems
            .where(
              (item) => (item['title'] as String).toLowerCase().contains(
                query.toLowerCase(),
              ),
            )
            .map((item) => item['title'] as String)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Clean Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.indigoInk.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.blueberry.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  style: AppTypography.subtitle1.copyWith(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: AppTypography.bodySmall.copyWith(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.black87,
                      size: 20,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              _onSearchChanged('');
                            },
                            child: Icon(
                              Icons.close_rounded,
                              color: Colors.black87,
                              size: 18,
                            ),
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 4,
                    ),
                  ),
                  cursorColor: AppColors.blueberry,
                ),
              ),
            ),

            // Results Grid
            Expanded(
              child: _filteredResults.isEmpty && _hasSearched
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 56,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No results',
                            style: AppTypography.subtitle1.copyWith(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1,
                          ),
                      itemCount: _filteredResults.length,
                      itemBuilder: (context, index) {
                        final itemTitle = _filteredResults[index];
                        final item = _allItems.firstWhere(
                          (element) => element['title'] == itemTitle,
                        );

                        return _buildSearchCard(
                          title: item['title'],
                          icon: item['icon'],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard({required String title, required IconData icon}) {
    return GestureDetector(
      onTap: () {
        // Handle card tap
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Card Image/Icon Area
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.indigoInk.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.blueberry.withOpacity(0.2),
                  width: 0.8,
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: AppColors.periwinkle.withOpacity(0.8),
                  size: 32,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall.copyWith(
              color: Colors.black,
              fontSize: 13,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}




