import 'package:ainbondhu/common/components.dart';
import 'package:ainbondhu/otp_screen.dart';
import 'package:ainbondhu/providers/auth_provider.dart';
import 'package:ainbondhu/providers/base_provider.dart';
import 'package:ainbondhu/ui/templates/base_page_template.dart';
import 'package:ainbondhu/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onLoginPressed(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final phone = _phoneController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a phone number')),
      );
      return;
    }

    // Call API
    final success = await authProvider.login(phone);
    if (success && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen(phoneNumber: phone)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return BasePageTemplate(
          isLoading: authProvider.state == ViewState.busy,
          errorMessage: authProvider.errorMessage,
          onErrorDismissed: authProvider.clearError,
          showAppBar: false,
          body: Column(
            children: [
              CommonHeader(
                onBack: () {},
                onSupport: () {},
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 20),
                  children: [
                    const SizedBox(height: 20),
                    const AppLogo(),
                    const SizedBox(height: 40),
                    const _WelcomeMessage(),
                    const SizedBox(height: 20),
                    _PhoneNumberInput(controller: _phoneController),
                    const SizedBox(height: 20),
                    _OtpButton(onPressed: () => _onLoginPressed(context)),
                    const SizedBox(height: 20),
                    const _OrDivider(),
                    const SizedBox(height: 20),
                    const _SocialLogins(),
                    const SizedBox(height: 20),
                    const _Footer(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
          style: AppTextStyles.bodyLarge,
        ),
      ],
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;

  const _PhoneNumberInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
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
  final VoidCallback onPressed;

  const _OtpButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(
        text: 'ওটিপি পাঠান',
        onPressed: onPressed,
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
