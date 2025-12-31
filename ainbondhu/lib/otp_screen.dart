import 'dart:async';

import 'package:ainbondhu/problem_selection_screen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _start = 30;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _isButtonDisabled = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void resetTimer() {
    setState(() {
      _start = 30;
      _isButtonDisabled = true;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.textTheme.bodyLarge?.color),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.support_agent, color: theme.primaryColor),
            label: Text(
              'সাহায্য প্রয়োজন?',
              style: TextStyle(color: theme.primaryColor),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Icon(Icons.balance, size: 80, color: theme.primaryColor),
                const SizedBox(height: 16),
                Text(
                  'আইনবন্ধু',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'আইন সেবায় আপনার বিশ্বস্ত সঙ্গী',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 40),
                Text(
                  'ওটিপি যাচাইকরণ',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'আমরা আপনার মোবাইল নম্বরে ৪ সংখ্যার একটি যাচাইকরণ কোড পাঠিয়েছি',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+৮৮০ ১৭১*****৮৯',
                      style: theme.textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildOtpTextField(context, first: true, last: false),
                      _buildOtpTextField(context, first: false, last: false),
                      _buildOtpTextField(context, first: false, last: false),
                      _buildOtpTextField(context, first: false, last: true),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _isButtonDisabled ? null : resetTimer,
                  child: Text(
                    'কোড পাননি? পুনরায় পাঠান',
                    style: TextStyle(
                      color:
                          _isButtonDisabled ? Colors.grey : theme.primaryColor,
                    ),
                  ),
                ),
                Text('00:${_start.toString().padLeft(2, '0')} সেকেন্ড'),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProblemSelectionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'যাচাই করুন',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primaryColor.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primaryColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'নিরাপত্তা ও গোপনীয়তা আমাদের সর্বোচ্চ অগ্রাধিকার',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpTextField(BuildContext context,
      {required bool first, required bool last}) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextField(
        autofocus: first,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Color(0xFFD0BB95)),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}