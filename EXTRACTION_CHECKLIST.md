# 📋 REMAINING SCREENS EXTRACTION CHECKLIST

## Screens Still to Extract from Original Files

### From `lib/screens_v2.dart` (3712 lines)
- [ ] **HomeScreenV2** → `lib/screens/home/home_screen.dart`
- [ ] **SearchScreenV2** → `lib/screens/explore/search_screen.dart`  
- [ ] **ShotsScreenV2** + **_buildReelItem** → `lib/screens/shorts/shorts_screen.dart`
- [ ] **AddPostScreenV2** (if exists) → `lib/screens/create/add_post_screen.dart`
- [ ] **NotificationScreenV2** → `lib/screens/notifications/notification_list_screen.dart`
- [ ] **ChatScreenV2** → `lib/screens/messaging/chat_list_screen.dart`
- [ ] **ChatDetailScreenV2** → `lib/screens/messaging/chat_detail_screen.dart`
- [ ] **CallScreenV2** → `lib/screens/messaging/call_screen.dart`
- [ ] **DatingScreenV2** → `lib/screens/explore/dating_screen.dart`
- [ ] **DatingChatScreenV2** → `lib/screens/messaging/dating_chat_screen.dart`

### From `lib/screens_profile_v2.dart` (unknown lines)
- [ ] **ProfileScreenV2** → `lib/screens/profile/profile_screen.dart`
- [ ] **ProfileEditScreen** (if exists) → `lib/screens/profile/edit_profile_screen.dart`
- [ ] **SettingsScreen** (if exists) → `lib/screens/profile/settings_screen.dart`

### From `lib/app_shell.dart` (830 lines)
- [ ] **AppShellV2** → `lib/app_shell.dart` (update with new imports)
- [ ] **BottomNavBar logic** → Extract to `lib/widgets/bottom_nav_bar.dart`

### From `lib/widgets/advanced_widgets.dart`
- [ ] **PremiumPostCard** → `lib/widgets/common/post_card.dart`
- [ ] Other custom widgets → Appropriate lib/widgets/category/ folder

---

## Template for Each Screen File

```dart
import 'package:flutter/material.dart';
import 'dart:ui';  // if needed for ImageFilter
import 'package:google_fonts/google_fonts.dart';  // if needed

import '../../config/app_theme.dart';
import '../../data/models/models_index.dart';
import '../../data/mock/mock_data_index.dart';
import '../../widgets/common/post_card.dart';  // reusable widgets

/// [FEATURE] Screen
/// Description of what this screen does
class [ScreenName] extends StatefulWidget {
  const [ScreenName]({Key? key}) : super(key: key);

  @override
  State<[ScreenName]> createState() => _[ScreenName]State();
}

class _[ScreenName]State extends State<[ScreenName]> {
  // Copy entire state implementation from original file
  
  @override
  Widget build(BuildContext context) {
    // Copy build method
  }
  
  // Copy all private helper methods
}
```

---

## Index File Template

```dart
/// [Feature] screens module
/// Import all screens from this module

export '[specific]_screen.dart';
export '[another]_screen.dart';
```

---

## Detailed Extraction Instructions

### 1. **HomeScreen Extraction**
- Location: screens_v2.dart (lines ~11-240)
- Imports needed:
  ```dart
  import '../../data/models/post_model.dart';
  import '../../data/models/user_model.dart';
  import '../../data/mock/posts_mock.dart';
  import '../../data/mock/users_mock.dart';
  import '../../widgets/common/post_card.dart';
  ```
- Key methods: `_buildStoryCircle()`, `_buildAddStory()`, `_onScroll()`

### 2. **SearchScreen Extraction**
- Location: screens_v2.dart (lines ~800-1100 approx)
- Imports needed:
  ```dart
  import '../../config/app_theme.dart';
  ```
- Key methods: `_onSearchChanged()`, `_buildSearchCard()`

### 3. **ShortsScreen Extraction**
- Location: screens_v2.dart (lines ~1500-2300 approx)
- Complex with many helper methods
- Imports needed:
  ```dart
  import 'dart:ui';
  import '../../data/models/post_model.dart';
  import '../../data/models/user_model.dart';
  import '../../data/mock/shorts_mock.dart';
  ```
- Key methods: `_buildReelItem()`, `_buildVerticalAction()`, `_formatNumber()`

### 4. **ProfileScreen Extraction**
- Location: screens_profile_v2.dart
- Imports needed: Models for user data
- Key methods: Profile display, stats, edit button handlers

### 5. **ChatScreen Extraction**
- Location: screens_v2.dart (lines ~2900-3200 approx)
- Imports needed:
  ```dart
  import '../../data/mock/chats_mock.dart';
  ```
- Creates two files: chat_list_screen.dart and chat_detail_screen.dart

### 6. **MessagingScreens Extraction**
- CallScreenV2 → call_screen.dart
- DatingChatScreenV2 → dating_chat_screen.dart
- Various chat helpers

---

## Quick Copy-Paste Checklist

For each screen:
- [ ] Create file in appropriate folder
- [ ] Copy imports from original
- [ ] Update relative imports to new paths
- [ ] Copy entire class definition
- [ ] Copy ALL helper methods (_build*, _handle*, _format*, etc.)
- [ ] Update any local references (e.g., MockDataService → MockPostsData)
- [ ] Create or update index file
- [ ] Test imports don't have errors

---

## Import Migration Map

| Old Import | New Import |
|-----------|-----------|
| `import 'models/models.dart'` | `import '../../data/models/models_index.dart'` |
| `import 'services/mock_data_service.dart'` | `import '../../data/mock/mock_data_index.dart'` |
| `import 'config/app_theme.dart'` | `import '../../config/app_theme.dart'` |
| `import 'widgets/advanced_widgets.dart'` | `import '../../widgets/common/post_card.dart'` |

---

## Common Pitfalls to Avoid

⚠️ **Don't forget to:**
- Update ALL relative import paths
- Copy ALL methods (even small helpers)
- Update references to MockDataService to correct mock file
- Test navigation works between screens
- Keep consistent naming (ScreenName + V2 vs just ScreenName)
- Update routes.dart with new imports

---

## Completion Order (Recommended)

1. ✅ Auth screens (DONE)
2. HomeScreen (most critical)
3. SearchScreen
4. ShortsScreen
5. ProfileScreen
6. ChatScreens (most complex)
7. NotificationScreen
8. Create/AddPost Screen
9. Widgets reorganization
10. Delete old files

**Priority**: HomeScreen → SearchScreen → ShortsScreen (these are visible first to users)
