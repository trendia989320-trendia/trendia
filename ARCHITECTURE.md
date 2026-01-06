# 🚀 LearnMitra - Next Level Mobile App

A production-grade Flutter app featuring communities, learning, entertainment, and social networking all in one platform.

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point with theme setup
├── app_shell.dart           # Main app shell with bottom nav
├── screens.dart             # Original screens (splash, intro, auth, onboarding)
├── screens_v2.dart          # Enhanced home, shots, search screens
├── screens_profile_v2.dart  # Profile, communities, chat, settings
├── widgets.dart             # Basic reusable widgets
├── widgets/
│   └── advanced_widgets.dart # Premium cards and components
├── models/
│   └── models.dart          # Data models (User, Post, Community, etc.)
├── services/
│   └── mock_data_service.dart # Mock data for development
└── config/
    └── app_theme.dart       # Theme, colors, typography, spacing
```

## ✨ Key Features

### 🎨 Design System
- **AppColors**: Light/Dark theme colors for Fun (Orange) & Learn (Indigo)
- **AppTypography**: Consistent text styles (H1-H4, Body, Caption)
- **AppSpacing**: Standardized spacing (xs-xxl)
- **AppRadius**: Consistent border radius
- **buildLightTheme() / buildDarkTheme()**: Complete Material 3 themes

### 📱 Screens Implemented

#### Authentication Flow
1. **SplashScreen** - Animated logo reveal
2. **IntroScreen** - "Fun, Learn & Earn" motto
3. **LoginScreen** - User authentication
4. **SignupScreen** - Account creation
5. **OnboardingScreen** - Preference discovery (3 slides)
6. **ContinueScreen** - Loading transition

#### Main App
1. **HomeScreenV2** - 
   - LearnScore Strike counter
   - Premium post cards with mock data
   - Post type badges (Fun/Learn)
   - Interaction buttons with animations

2. **ShotsScreenV2** - 
   - Vertical reel feed
   - Fun/Learn toggle with animated underline
   - Full-screen reel experience

3. **AddPostScreenV2** - 
   - Type selector (Fun/Learn)
   - Caption editor
   - Media buttons
   - Smart post validation

4. **ChatScreenV2** - 
   - Chat list with mock data
   - Find Date feature with rose currency
   - Unread badge notifications
   - Chat detail view

5. **ProfileScreenV2** - 
   - User profile header
   - LearnScore card
   - Progress graphs (Fun/Learn/Earnings)
   - Community explorer button
   - Time spent stats

6. **SettingsScreenV2** - 
   - Dating mode toggle (fully functional)
   - Account settings
   - Privacy options
   - Notifications
   - Theme selector
   - Logout button

#### Supporting Screens
- **SearchScreenV2** - Skill & people search
- **CommunitiesScreenV2** - All communities with join/leave
- **ChatDetailScreenV2** - One-on-one messaging
- **SettingsScreenV2** - Complete settings panel

## 📊 Mock Data Included

### Users (4 profiles)
- John Doe (Flutter Developer)
- Sarah Ahmed (Web Designer)
- Raj Patel (Data Scientist)
- Emma Wilson (Content Creator)

### Posts (5 example posts)
- Mixed Fun & Learn content
- Author info, timestamps
- Like/comment/share counts
- Realistic engagement

### Communities (4 communities)
- Flutter Developers (2.5K members)
- Python Masters (32K members)
- Web Design Hub (28K members)
- AI & Machine Learning (19K members)
- Event countdowns (6-12 days)

### Chats (4 conversations)
- User avatars
- Last message preview
- Unread counts
- Relative timestamps

### Notifications (4 alerts)
- Event countdown
- Community updates
- Messages
- Achievements

## 🎯 Component Highlights

### PremiumPostCard
```dart
- Author header with badge
- Title & description
- Content area with emoji placeholder
- Stats: likes, comments, shares
- Time ago display
- Like button with scale animation
- Comment & share buttons
```

### CommunityCardV2
```dart
- Icon & name header
- Description
- Member count
- Event countdown banner
- Join/Joined button with state
```

### ChatBubble
```dart
- Left/right alignment based on sender
- Time stamps
- Sender identification
- Elegant styling
```

### Advanced Navigation
- Material 3 NavigationBar
- Smooth transitions
- Icon state changes
- Bottom sheet styling

## 🎨 Color Scheme

### Light Mode
- Primary: `#6366F1` (Indigo)
- Fun: `#F97316` (Orange)
- Surface: `#FFFFFF`
- Background: `#FBFBFB`

### Dark Mode
- Primary: `#818CF8` (Light Indigo)
- Fun: `#F97316` (Orange)
- Surface: `#1A1A1A`
- Background: `#0F0F0F`

## 🔄 Navigation Flow

```
SplashScreen (3s)
    ↓
IntroScreen (3 slides)
    ↓
LoginScreen / SignupScreen
    ↓
OnboardingScreen (3 slides)
    ↓
ContinueScreen (2s)
    ↓
AppShellV2 (Main App with Bottom Nav)
    ├── HomeScreenV2
    ├── ShotsScreenV2
    ├── AddPostScreenV2
    ├── ChatScreenV2
    │   └── ChatDetailScreenV2
    └── ProfileScreenV2
        └── CommunitiesScreenV2
        └── SettingsScreenV2
```

## 🚀 Running the App

```bash
cd d:\my\ music\ app\learn_mitra
flutter pub get
flutter run
```

## 📋 Key Enhancements Made

1. ✅ Professional theming system
2. ✅ Complete mock data service
3. ✅ Premium UI components
4. ✅ Animation controllers
5. ✅ Dark mode support
6. ✅ Responsive layouts
7. ✅ Interactive components
8. ✅ Material 3 design language
9. ✅ Community event countdowns
10. ✅ Dating mode toggle (working)

## 🎯 Architecture Benefits

- **Scalable**: Models can easily connect to real APIs
- **Maintainable**: Separated concerns (screens, widgets, models, services)
- **Themeable**: Easy to customize colors/spacing
- **Testable**: MockDataService can be swapped with real service
- **Reusable**: Advanced widgets work across screens

## 🔮 Next Steps for Production

1. Connect to Firebase for authentication
2. Implement real database (Firestore)
3. Add image upload to cloud storage
4. Implement real-time messaging
5. Add push notifications
6. Analytics integration
7. App store deployment

---

**Built with ❤️ using Flutter & Material Design 3**
