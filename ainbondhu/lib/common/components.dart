import 'package:flutter/material.dart';
import 'package:ainbondhu/utils/app_theme.dart';

/// Standard App Logo Widget
class AppLogo extends StatelessWidget {
  final double iconSize;
  final double fontSize;
  final bool showSubtitle;

  const AppLogo({
    super.key,
    this.iconSize = 80,
    this.fontSize = 32,
    this.showSubtitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.balance, size: iconSize, color: AppColors.primary),
        const SizedBox(height: 16),
        Text(
          'আইনবন্ধু',
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineLarge.copyWith(fontSize: fontSize),
        ),
        if (showSubtitle) ...[
          const SizedBox(height: 8),
          const Text(
            'আইন সেবায় আপনার বিশ্বস্ত ডিজিটাল সঙ্গী',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge, // Replaced explicit style
          ),
        ],
      ],
    );
  }
}

/// Custom Elevated Button
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Manrope', fontWeight: FontWeight.bold),
        ),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(icon, color: Colors.white),
        ],
      ],
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: child,
    );
  }
}

/// Common Header (AppBar replacement)
class CommonHeader extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSupport;

  const CommonHeader({
    super.key,
    this.onBack,
    this.onSupport,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onBack != null)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack,
            )
          else
            const SizedBox(width: 48), // Spacer
          TextButton.icon(
            icon: const Icon(Icons.support_agent, color: AppColors.primary),
            label: const Text('সাহায্য প্রয়োজন?', style: TextStyle(color: AppColors.primary)),
            onPressed: onSupport ?? () {},
          ),
        ],
      ),
    );
  }
}

/// Common Drawer (SideBar)
class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.balance, color: Colors.white, size: 48),
                const SizedBox(height: 10),
                const Text(
                  'আইনবন্ধু',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('হোম'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('প্রোফাইল'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('ইতিহাস'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
           ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('সেটিংস'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

/// Common Bottom Navigation Bar
class CommonNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CommonNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'হোম',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'চ্যাট',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'প্রোফাইল',
        ),
      ],
    );
  }
}
