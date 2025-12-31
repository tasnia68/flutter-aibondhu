# Usage Guide for AinBondhu Common Components

This guide explains how to use the common components and theme utilities created for the AinBondhu application.

## 1. App Theme (`lib/utils/app_theme.dart`)

The `AppTheme` class provides centralized access to colors and text styles.

### Colors
Use `AppColors` for consistency.

```dart
import 'package:ainbondhu/utils/app_theme.dart';

Color primary = AppColors.primary;       // 0xFFD0BB95
Color bg = AppColors.background;         // 0xFFF7F7F6
Color text = AppColors.textPrimary;      // 0xFF2A3441
```

### Text Styles
Use `AppTextStyles` for standard typography.

```dart
import 'package:ainbondhu/utils/app_theme.dart';

Text(
  'Headline',
  style: AppTextStyles.headlineMedium,
)
```

## 2. Common Components (`lib/common/components.dart`)

### AppLogo
Displays the standard application logo.

```dart
import 'package:ainbondhu/common/components.dart';

const AppLogo(
  iconSize: 80,       // Optional
  fontSize: 32,       // Optional
  showSubtitle: true, // Optional
)
```

### CustomButton
A standard elevated button with the primary color.

```dart
import 'package:ainbondhu/common/components.dart';

CustomButton(
  text: 'Click Me',
  onPressed: () {
    // Action
  },
  icon: Icons.check, // Optional
)
```

### CommonHeader
A standard header row (replaces AppBar in some designs) with a back button and a "Support" button.

```dart
import 'package:ainbondhu/common/components.dart';

CommonHeader(
  onBack: () {
    Navigator.pop(context);
  },
  onSupport: () {
    // Handle support action
  },
)
```

### CommonDrawer (Side Bar)
A standard side menu drawer.

```dart
import 'package:ainbondhu/common/components.dart';

Scaffold(
  drawer: const CommonDrawer(),
  // ...
)
```

### CommonNavBar
A standard bottom navigation bar.

```dart
import 'package:ainbondhu/common/components.dart';

Scaffold(
  bottomNavigationBar: CommonNavBar(
    currentIndex: _selectedIndex,
    onTap: (index) {
      setState(() => _selectedIndex = index);
    },
  ),
  // ...
)
```
