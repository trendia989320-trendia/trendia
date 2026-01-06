# LearnMitra App - Project Restructuring Guide

## 📁 NEW PROJECT STRUCTURE

```
lib/
├── main.dart                           # App entry point
├── routes.dart                         # Route definitions (UPDATED)
├── app_shell.dart                      # Main app shell (UPDATED)
│
├── config/
│   ├── app_theme.dart                 # Theme configuration (EXISTING)
│
├── data/
│   ├── models/
│   │   ├── models_index.dart          # Central model export
│   │   ├── user_model.dart            # User data model
│   │   ├── post_model.dart            # Post/content model
│   │   ├── chat_model.dart            # Chat and message models
│   │   ├── community_model.dart       # Community model
│   │   └── notification_model.dart    # Notification model
│   │
│   └── mock/
│       ├── mock_data_index.dart       # Central mock data export
│       ├── users_mock.dart            # Mock user data
│       ├── posts_mock.dart            # Mock post data
│       ├── dating_profiles_mock.dart  # Mock dating profiles
│       ├── shorts_mock.dart           # Mock shorts/reels data
│       ├── chats_mock.dart            # Mock chat data
│       └── notifications_mock.dart    # Mock notifications
│
├── screens/
│   ├── auth/
│   │   ├── auth_screens_index.dart    # Auth screens export
│   │   ├── splash_screen.dart         # Splash screen
│   │   ├── intro_screen.dart          # Onboarding
│   │   ├── login_screen.dart          # Login
│   │   ├── signup_screen.dart         # Sign up
│   │   ├── verification_screen.dart   # Email verification
│   │   ├── setup_profile_screen.dart  # Profile setup
│   │   └── forgot_password_screen.dart# Password reset
│   │
│   ├── home/
│   │   ├── home_screen.dart           # Feed/home
│   │   └── home_screen_index.dart
│   │
│   ├── explore/
│   │   ├── search_screen.dart         # Search/explore
│   │   └── search_screen_index.dart
│   │
│   ├── shorts/
│   │   ├── shorts_screen.dart         # Vertical reels (Fun/Learn)
│   │   └── shorts_screen_index.dart
│   │
│   ├── create/
│   │   ├── add_post_screen.dart       # Create post
│   │   └── create_screen_index.dart
│   │
│   ├── profile/
│   │   ├── profile_screen.dart        # User profile
│   │   ├── profile_settings.dart      # Profile settings
│   │   └── profile_screen_index.dart
│   │
│   └── messaging/
│       ├── chat_list_screen.dart      # All chats
│       ├── chat_detail_screen.dart    # Individual chat
│       ├── call_screen.dart           # Call/video call
│       └── messaging_screen_index.dart
│
├── widgets/
│   ├── common/
│   │   ├── post_card.dart             # Reusable post card
│   │   ├── user_avatar.dart           # User avatar widget
│   │   ├── action_button.dart         # Action buttons
│   │   └── common_index.dart
│   │
│   ├── notifications/
│   │   ├── notification_item.dart     # Notification item
│   │   └── notification_index.dart
│   │
│   └── advanced_widgets.dart          # Complex custom widgets
│
├── services/
│   ├── theme_service.dart             # Theme management (EXISTING)
│   └── api_service.dart               # Future API service
│
└── models/
    └── models.dart                     # (OLD - DEPRECATED - DELETE)
```

## 🔄 MIGRATION GUIDE

### ✅ COMPLETED STEPS
1. ✅ Created data/models/ folder with individual model files
2. ✅ Created data/mock/ folder with mock data separated by feature
3. ✅ Created screens/auth/ with all auth screens separated
4. ✅ Organized models using index files for easy imports
5. ✅ Organized mock data using index files for easy imports

### ⏳ NEXT STEPS TO COMPLETE

1. **Create Remaining Screens** (Home, Search, Shorts, Profile, Messaging)
   - Extract from screens_v2.dart, screens_profile_v2.dart, app_shell.dart
   - One file per feature/function
   - Use index files for exports

2. **Organize Widgets**
   - Move PremiumPostCard and other widgets to lib/widgets/
   - Create categories: common/, notifications/, etc.
   - Use index files for organized exports

3. **Update Routes**
   - Update lib/routes.dart to import from new screen locations
   - Change imports from old files to new structure

4. **Update App Shell**
   - Create new app_shell.dart importing from new screen locations

5. **Update main.dart**
   - Update imports to use new structure

6. **Delete Old Files**
   - Delete lib/screens/auth_screens.dart
   - Delete lib/screens_v2.dart
   - Delete lib/screens_profile_v2.dart
   - Delete lib/screens_settings_v2.dart
   - Delete lib/models/models.dart (after migration)
   - Delete lib/services/mock_data_service.dart (after migration)
   - Delete old lib/widgets/advanced_widgets.dart (after migration)

## 📚 IMPORT EXAMPLES

### Before (Old Structure)
```dart
import 'screens/auth_screens.dart';
import 'models/models.dart';
import 'services/mock_data_service.dart';
```

### After (New Structure)
```dart
// Auth screens
import 'screens/auth/splash_screen.dart';
import 'screens/auth/login_screen.dart';

// Or use index for all auth screens
import 'screens/auth/auth_screens_index.dart';

// Models
import 'data/models/user_model.dart';
import 'data/models/post_model.dart';

// Or use index for all models
import 'data/models/models_index.dart';

// Mock data
import 'data/mock/users_mock.dart';
import 'data/mock/posts_mock.dart';

// Or use index for all mock data
import 'data/mock/mock_data_index.dart';
```

## 🎯 BENEFITS OF NEW STRUCTURE

✅ **Scalability** - Easy to add new features without cluttering
✅ **Maintainability** - Clear separation of concerns
✅ **Testability** - Easier to unit test individual components
✅ **Performance** - Lighter import trees
✅ **Backend Integration** - Ready for API integration without refactoring
✅ **Team Collaboration** - Multiple developers can work on different features
✅ **Code Organization** - Logical grouping makes code discoverable

## 📝 NAMING CONVENTIONS

- **Screens**: `[feature]_screen.dart` (e.g., login_screen.dart)
- **Models**: `[entity]_model.dart` (e.g., user_model.dart)
- **Mock Data**: `[entity]_mock.dart` (e.g., users_mock.dart)
- **Widgets**: `[widget_purpose].dart` (e.g., post_card.dart)
- **Services**: `[service_name]_service.dart`
- **Index files**: `[category]_index.dart` for exports

## 🚀 NEXT IMMEDIATE ACTIONS

1. Create remaining screen files (home, search, shorts, profile, messaging)
2. Reorganize widgets into categorized folders
3. Update all imports in routes.dart and app_shell.dart
4. Run `flutter pub get` to ensure no import errors
5. Delete old monolithic files
6. Test navigation between all screens
