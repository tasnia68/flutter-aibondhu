
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const _Header(),
              Expanded(
                child: ListView(
                  children: const [
                    SizedBox(height: 20),
                    _Logo(),
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
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          TextButton.icon(
            icon: const Icon(Icons.support_agent),
            label: const Text('সাহায্য প্রয়োজন?'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.balance, size: 80, color: Color(0xFFD0BB95)),
        const SizedBox(height: 16),
        const Text(
          'আইনবন্ধু',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'আইন সেবায় আপনার বিশ্বস্ত ডিজিটাল সঙ্গী',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'স্বাগতম!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'শুরু করতে আপনার মোবাইল নম্বর দিন',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
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
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD0BB95),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'ওটিপি পাঠান',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
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
              style: TextStyle(color: Color(0xFFD0BB95)),
            ),
            TextSpan(text: ' এবং '),
            TextSpan(
              text: 'গোপনীয়তা নীতিতে',
              style: TextStyle(color: Color(0xFFD0BB95)),
            ),
            TextSpan(text: ' সম্মত হচ্ছেন।'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
