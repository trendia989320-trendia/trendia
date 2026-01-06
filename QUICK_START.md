# 🚀 LearnMitra - Quick Start Guide

## Installation & Setup

### Prerequisites
- Flutter SDK (latest stable)
- Dart SDK
- Android Studio / Xcode / VS Code

### Clone & Install

```bash
cd "d:\my music app\learn_mitra"
flutter pub get
```

### Run the App

```bash
flutter run
```

Or with device specification:
```bash
flutter run -d chrome          # Web
flutter run -d android         # Android Emulator
flutter run -d "iPhone 14"    # iOS Simulator
```

---

## 🎮 Using the App

### First Time Launch Flow
1. **Splash Screen** (3 seconds)
   - Animated app logo appears
   - "LearnMitra" brand reveal

2. **Intro Screen**
   - "Fun, Learn & Earn" core values
   - Single screen, simple message

3. **Login/Signup**
   - Enter email and password
   - Create new account or login

4. **Onboarding** (3 slides)
   - Slide 1: "What Interests You?"
   - Slide 2: "Share Your Skills"
   - Slide 3: "Connect & Grow"

5. **Continue Screen**
   - 2-second loading animation
   - Auto-transition to Home

### Main App Navigation

**Bottom Navigation (5 tabs)**:

| Icon | Screen | Features |
|------|--------|----------|
| 🏠 | Home | Feed with posts, LearnScore |
| ▶️ | Shots | Vertical reel feed (Fun/Learn toggle) |
| ➕ | Add | Create posts (type selector) |
| 💬 | Chat | Messages + Find Date |
| 👤 | Profile | Stats, Communities, Settings |

---

## 🎯 Feature Walkthrough

### 🏠 Home Screen
- **Top Bar**: Logo, search, notifications
- **LearnScore Card**: Shows current score & streak
- **Feed**: Mock posts with author info
- **Posts Show**:
  - Author avatar & info
  - Fun/Learn badge
  - Post title & description
  - Engagement stats (likes, comments, shares)
  - Like button with animation
  - Interaction buttons

**Actions**:
- Tap post to interact
- Like button scales on tap
- Notification shows countdown

### ▶️ Shots Screen
- **Toggle Top**: "Fun" | "Learn"
  - Tap to switch content type
  - Animated underline indicates selection
- **Full-Screen Reels**: Vertical swipe
- **Content**: Large emoji + title
- **Bottom Controls**: Like, comment, share, save

**Actions**:
- Swipe up/down to change reel
- Tap emoji area to see details
- Engage with bottom buttons

### ➕ Add (Create Post)
- **Type Selector**: Choose "Fun" or "Learn"
  - Large button with emoji
  - Toggles on selection
- **Caption Field**: Write your post
  - Placeholder text
  - Multi-line support
- **Media Buttons**: 
  - Image upload
  - Video upload
- **Post Button**: Publish (enabled when type selected)

**Actions**:
- Select type (required)
- Write caption (required)
- Add media (optional)
- Tap Post to publish (success snackbar)

### 💬 Chat
**Messaging Tab** (default):
- List of recent conversations
- User avatar, name, last message
- Unread badge (red circle with count)
- Tap to open chat detail

**Chat Detail**:
- Header: User name & status
- Message bubbles (left/right aligned)
- Time stamps
- Input field + send button

**Find Date** (FAB):
- Toggle to dating mode
- Grid of user profiles
- User avatar, name, username
- 🌹 Rose button
- Tap to send rose (success snackbar)

**Actions**:
- Tap user → open chat detail
- FAB toggles between messaging & dating
- Type message → send
- Send rose → confirmation

### 👤 Profile
- **Header**: Avatar, name, username, bio
- **Stats**: Followers, following counts
- **LearnScore Card**: 
  - Fire emoji + score
  - Current points
  - Trend indicator (↑ 250)
- **Time Spent**: Card with hours
- **Progress Graphs**: 
  - Fun Progress: visual bar + %
  - Learn Progress: visual bar + %
  - Earnings: visual bar + %
- **Communities Button**: Explore all communities

**Nested Screens**:

**Communities View**:
- List of all communities
- Community card with:
  - Icon + name
  - Description
  - Member count
  - Event countdown (days left)
  - Join/Joined button
- Tap button to toggle membership

**Settings** (⚙️ icon in profile header):
- **Account Section**:
  - Edit Profile option
  - Privacy & Security option
- **Preferences Section**:
  - **Dating Mode Toggle** ⭐ (fully functional)
    - Switch on/off
    - Shows confirmation snackbar
    - Toggle persistent across sessions
  - Notifications option
  - Theme option
- **More Section**:
  - Help & Support
  - About
- **Logout Button**: Red button at bottom

**Actions**:
- Edit profile → profile editor
- Dating mode → toggle + notification
- Settings options → submenu
- Logout → confirmation + back to login

---

## 🎨 Theme & Appearance

### Light Mode
- Clean white backgrounds
- Indigo primary color (#6366F1)
- Orange fun content (#F97316)
- Dark grey text (#1F2937)

### Dark Mode
- Dark backgrounds (#0F0F0F)
- Light indigo primary (#818CF8)
- Same orange (#F97316)
- Light text (#E5E7EB)

**Switch Theme**:
- Theme follows system setting
- Can be changed in settings
- Smooth transition between modes

---

## 📊 Mock Data Overview

### Users (4 profiles available)
1. **John Doe** (@johndoe) - Flutter Developer
   - Avatar: 👨, Followers: 2.4K, Following: 580
   - LearnScore: 4250, Time: 125.5 hours

2. **Sarah Ahmed** (@sarahcodes) - Web Designer
   - Avatar: 👩, Followers: 3.2K, Following: 420
   - LearnScore: 5680, Time: 182.3 hours

3. **Raj Patel** (@rajpatel) - Data Scientist
   - Avatar: 🧑, Followers: 1.9K, Following: 650
   - LearnScore: 6420, Time: 210.8 hours

4. **Emma Wilson** (@emmaw) - Content Creator
   - Avatar: 👩‍🦰, Followers: 4.1K, Following: 220
   - LearnScore: 7200, Time: 245.2 hours

### Posts (5 examples)
1. Flutter Widget Deep Dive (Learn)
   - 523 likes, 87 comments, 45 shares
   - Posted 2 hours ago

2. Weekend Coding Challenge (Fun)
   - 892 likes, 156 comments, 203 shares
   - Posted 5 hours ago

3. Machine Learning Basics (Learn)
   - 1,245 likes, 234 comments, 567 shares
   - Posted 8 hours ago

4. My Journey to 10K Followers (Fun)
   - 2,450 likes, 445 comments, 890 shares
   - Posted 12 hours ago

5. State Management in Flutter (Learn)
   - 678 likes, 123 comments, 234 shares
   - Posted 15 hours ago

### Communities (4 groups)
1. **Flutter Developers** 🎨
   - 45,230 members
   - Event: "Flutter Summit 2025" in 5 days

2. **Python Masters** 🐍
   - 32,150 members
   - Event: "Python Conference" in 8 days

3. **Web Design Hub** 🎭
   - 28,500 members
   - Event: "Design Thinking Workshop" in 12 days

4. **AI & Machine Learning** 🤖
   - 19,800 members
   - Event: "AI Innovation Expo" in 10 days

---

## 🔧 Customization Tips

### Change Primary Color
Edit in `lib/config/app_theme.dart`:
```dart
class AppColors {
  static const Color primaryLight = Color(0xFF6366F1); // Change this
  static const Color primaryDark = Color(0xFF818CF8);  // And this
}
```

### Add New Screen
1. Create class in appropriate file:
   ```dart
   class MyScreen extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: const Text('My Screen')),
         body: Center(child: Text('Content')),
       );
     }
   }
   ```

2. Add to `IndexedStack` in `AppShellV2`
3. Add to `NavigationBar` destinations

### Change Mock Data
Edit `lib/services/mock_data_service.dart`:
```dart
static final List<Post> mockPosts = [
  Post(
    id: '1',
    // ... your data
  ),
];
```

### Modify Theme
Edit `lib/config/app_theme.dart`:
- Colors: `AppColors`
- Spacing: `AppSpacing`
- Typography: `AppTypography`
- Radius: `AppRadius`

---

## 🐛 Troubleshooting

### App won't run
```bash
flutter clean
flutter pub get
flutter run
```

### Errors on startup
```bash
flutter pub get --upgrade
flutter pub cache repair
```

### Hot reload not working
- Stop and restart: `flutter run`
- Rebuild: `flutter run --release` (slower)

### Theme not changing
- Restart app (hot reload won't work for theme)
- Check `Theme.of(context)` usage

### Mock data not showing
- Check `MockDataService` is imported
- Verify mock data initialization in `initState()`

---

## 📱 Device Testing

### Android Emulator
```bash
flutter emulators
flutter emulators launch <emulator_name>
flutter run
```

### iOS Simulator
```bash
open -a Simulator
flutter run
```

### Web (Desktop Testing)
```bash
flutter run -d chrome
```

### Physical Device
```bash
flutter devices
flutter run -d <device_id>
```

---

## 🎯 Next Steps

1. **Test all screens**: Go through entire flow
2. **Try interactions**: Like posts, toggle settings
3. **Test dark mode**: Change in settings
4. **Explore mock data**: Check all 4 users & 4 communities
5. **Connect backend**: Replace MockDataService with API calls

---

## 📞 Need Help?

### Common Issues

| Issue | Solution |
|-------|----------|
| App won't start | Run `flutter clean` then `flutter run` |
| Bottom nav not working | Check `_selectedIndex` in `AppShellV2` |
| Theme not updating | Restart app (not hot reload) |
| Mock data empty | Verify imports in screens |
| Animation jerky | Use `--profile` mode: `flutter run --profile` |

---

## 🎉 You're All Set!

Your **LearnMitra** app is ready to explore. Start with the home screen and navigate through all features using the bottom navigation.

**Enjoy! 🚀**
