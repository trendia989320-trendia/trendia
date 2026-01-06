# 🎨 LearnMitra - Design System & Components Guide

## 📐 Spacing System

```
xs    = 4px      └─ Small gaps, padding
sm    = 8px      └─ Minor spacing
md    = 12px     └─ Standard padding
lg    = 16px     └─ Main padding/margin
xl    = 24px     └─ Large sections
xxl   = 32px     └─ Page spacing
```

## 🎯 Typography Hierarchy

```
Heading 1: 32px Bold (not used in app)
Heading 2: 28px Bold
Heading 3: 24px Bold   └─ Page titles
Heading 4: 20px SemiBold └─ Section titles
Subtitle 1: 16px SemiBold └─ Important text
Subtitle 2: 14px SemiBold └─ Card titles
Body: 16px Regular    └─ Main text
Body Small: 14px Regular
Caption: 12px Regular
Caption Small: 11px Regular
```

## 🌈 Color Palette

### Semantic Colors
```
Success: #10B981 (Green)    └─ Positive actions
Error:   #EF4444 (Red)      └─ Destructive actions
Warning: #FB923C (Orange)   └─ Caution states
Info:    #3B82F6 (Blue)     └─ Informational
```

### Theme-Specific
```
LIGHT MODE                  DARK MODE
├─ Primary: #6366F1    ├─ Primary: #818CF8
├─ Surface: #FFFFFF    ├─ Surface: #1A1A1A
├─ BG: #FBFBFB         ├─ BG: #0F0F0F
├─ Text Dark: #1F2937  ├─ Text Dark: #E5E7EB
└─ Text Grey: #9CA3AF  └─ Text Grey: #9CA3AF

Fun Color: #F97316 (Orange - consistent across themes)
Learn Color: #6366F1 / #818CF8 (Indigo - primary)
```

## 🧩 Advanced Components

### 1. PremiumPostCard
**Location**: `widgets/advanced_widgets.dart`

```dart
PremiumPostCard(
  post: post,
  onLike: () { },
  onComment: () { },
  onShare: () { },
)
```

**Features**:
- Author avatar + info
- Post type badge (Fun/Learn)
- Content area with emoji
- Stats display
- Animated like button
- Time ago calculation

### 2. CommunityCardV2
**Location**: `widgets/advanced_widgets.dart`

```dart
CommunityCardV2(
  community: community,
  onJoinTap: () { },
)
```

**Features**:
- Icon & description
- Member count
- Event countdown
- Join state toggle
- Color-coded borders

### 3. ChatBubble
**Location**: `widgets/advanced_widgets.dart`

```dart
ChatBubble(
  message: message,
  isCurrentUser: true,
)
```

**Features**:
- Left/right alignment
- Time stamps
- Current user styling
- Responsive width

### 4. AnimatedNavItem
**Location**: `widgets/advanced_widgets.dart`

```dart
AnimatedNavItem(
  icon: Icons.home,
  label: 'Home',
  isSelected: true,
  onTap: () { },
)
```

**Features**:
- Icon scaling
- Bottom indicator
- Color transitions

## 🎬 Animation Details

### LikeButton Animation
```
Duration: 600ms
Curve: elasticOut
Scale: 1.0 → 1.2 → 1.0
Controller: Single use, forward then reverse
```

### PageView Transitions
```
Vertical (Shots): Vertical scroll
Horizontal (Onboarding): Horizontal scroll
```

### Navigation
```
Default: MaterialPageRoute (fade transition)
Custom: Can add PageRouteBuilder for custom transitions
```

## 📱 Responsive Design

All components use:
- `double.infinity` for width
- `crossAxisAlignment: CrossAxisAlignment.start` for consistency
- `SingleChildScrollView` for overflow handling
- `ListView.builder` for large lists

## 🎯 PostType System

```dart
enum PostType { fun, learn }

// Usage
post.type == PostType.fun  ? AppColors.funColor : AppColors.learnColor
post.type == PostType.fun  ? 'FUN' : 'LEARN'
post.type == PostType.fun  ? Icons.emoji_events : Icons.school
```

## 🔌 Integration Points

### Adding New Screens
```dart
// 1. Create screen in screens_v2.dart or screens_profile_v2.dart
class MyNewScreen extends StatelessWidget {
  // Use AppTypography, AppColors, AppSpacing
}

// 2. Add to AppShellV2's IndexedStack
IndexedStack(
  index: _selectedIndex,
  children: [
    // ... existing screens
    MyNewScreen(),
  ],
)

// 3. Add to NavigationBar
destinations: const [
  // ... existing items
  NavigationDestination(
    icon: Icon(Icons.my_icon),
    label: 'New',
  ),
]
```

### Adding New Components
```dart
// 1. Create in widgets/advanced_widgets.dart
class MyComponent extends StatelessWidget {
  // Follow existing patterns
  // Use AppTypography.*, AppColors.*, AppSpacing.*
}

// 2. Use in screens
MyComponent(
  param1: value1,
  onTap: () { },
)
```

### Connecting to Backend
```dart
// In MockDataService, replace with API calls
static Future<List<Post>> getPosts() async {
  // const response = await api.getPosts();
  // return response.map((p) => Post.fromJson(p)).toList();
  return mockPosts; // Currently returns mock
}
```

## 🌙 Dark Mode Implementation

Every screen uses:
```dart
final isDark = Theme.of(context).brightness == Brightness.dark;

// Then apply colors conditionally
color: isDark ? AppColors.textDarkDark : AppColors.textDarkLight,
```

## 📊 Current File Count

- **Models**: 1 file (13 models/enums)
- **Services**: 1 file (MockDataService)
- **Config**: 1 file (Theme, Colors, Typography)
- **Widgets**: 2 files (basic + advanced)
- **Screens**: 3 files (original + v2 + profile_v2)
- **Shell**: 1 file (AppShellV2 + AddPostScreenV2)
- **Main**: 1 file (entry point)

**Total**: 10 well-organized files

## 🎓 Code Patterns Used

### State Management
```dart
// Using setState for simple state
late List<Post> _posts;

@override
void initState() {
  _posts = MockDataService.mockPosts.map(...).toList();
}

// Then in UI
_posts[index].isLiked = !_posts[index].isLiked;
```

### Responsive Lists
```dart
ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemBuilder: (context, index) => YourWidget(),
)
```

### Container Styling
```dart
Container(
  padding: const EdgeInsets.all(AppSpacing.lg),
  decoration: BoxDecoration(
    color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
    borderRadius: BorderRadius.circular(AppRadius.lg),
    border: Border.all(color: color.withOpacity(0.3)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  ),
)
```

---

**This system is production-ready and scalable! 🚀**
