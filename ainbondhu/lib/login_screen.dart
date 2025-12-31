import 'package:ainbondhu/common/components.dart';
import 'package:ainbondhu/otp_screen.dart';
import 'package:ainbondhu/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            CommonHeader(
              // Back button hidden or handled
              onBack: () {}, // Or null if no back
              onSupport: () {},
            ),
            Expanded(
              child: ListView(
                children: const [
                  SizedBox(height: 20),
                  AppLogo(),
                  SizedBox(height: 40),
                  _WelcomeMessage(),
                  SizedBox(height: 20),
                  _PhoneNumberInput(),
                  SizedBox(height: 20),
                  _OtpButton(),
                  SizedBox(height: 20),
                  _OrDivider(),
                  SizedBox(height: 20),
                  _SocialLogins(),
                  SizedBox(height: 20),
                  _Footer(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'স্বাগতম!',
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineSmall,
        ),
        SizedBox(height: 8),
        Text(
          'শুরু করতে আপনার মোবাইল নম্বর দিন',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLarge, // Used bodyLarge but color grey might be needed
        ),
      ],
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('🇧🇩 +৮৮০'),
                SizedBox(width: 8),
                VerticalDivider(
                  color: Colors.grey,
                  width: 1,
                  thickness: 1,
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
          hintText: '1XXXXXXXXX',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class _OtpButton extends StatelessWidget {
  const _OtpButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        text: 'ওটিপি পাঠান',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OtpScreen()),
          );
        },
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('অথবা'),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

class _SocialLogins extends StatelessWidget {
  const _SocialLogins();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              icon: SvgPicture.asset('assets/images/google_logo.svg', width: 24, height: 24),
              label: const Text('গুগল'),
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: OutlinedButton.icon(
              icon: SvgPicture.asset('assets/images/apple_logo.svg', width: 24, height: 24),
              label: const Text('অ্যাপল'),
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text.rich(
        TextSpan(
          text: 'চালিয়ে যাওয়ার মাধ্যমে আপনি আমাদের ',
          children: [
            TextSpan(
              text: 'শর্তাবলী',
              style: TextStyle(color: AppColors.primary),
            ),
            TextSpan(text: ' এবং '),
            TextSpan(
              text: 'গোপনীয়তা নীতিতে',
              style: TextStyle(color: AppColors.primary),
            ),
            TextSpan(text: ' সম্মত হচ্ছেন।'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
