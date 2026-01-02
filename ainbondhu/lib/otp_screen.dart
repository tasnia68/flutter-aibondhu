import 'dart:async';

import 'package:ainbondhu/common/components.dart';
import 'package:ainbondhu/problem_selection_screen.dart';
import 'package:ainbondhu/providers/auth_provider.dart';
import 'package:ainbondhu/providers/base_provider.dart';
import 'package:ainbondhu/ui/templates/base_page_template.dart';
import 'package:ainbondhu/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber; // Added parameter

  const OtpScreen({super.key, this.phoneNumber = '017XXXXXXXX'});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _start = 30;
  bool _isButtonDisabled = true;

  // Controllers for each digit
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
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

  void _onVerifyPressed(BuildContext context) async {
    String otp = _controllers.map((e) => e.text).join();
    if (otp.length < 4) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid 4-digit OTP')),
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success = await authProvider.verifyOtp(widget.phoneNumber, otp);

    if (success && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ProblemSelectionScreen()),
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
          showAppBar: false, // We use custom header
          body: Column(
            children: [
               CommonHeader(
                onBack: () => Navigator.of(context).pop(),
                onSupport: () {},
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          const AppLogo(),
                          const SizedBox(height: 40),
                          const Text(
                            'ওটিপি যাচাইকরণ',
                            style: AppTextStyles.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'আমরা আপনার মোবাইল নম্বরে ৪ সংখ্যার একটি যাচাইকরণ কোড পাঠিয়েছি',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyMedium,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.phoneNumber,
                                style: AppTextStyles.titleLarge,
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit, size: 20),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Form(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(4, (index) => _buildOtpTextField(context, index)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: _isButtonDisabled ? null : resetTimer,
                            child: Text(
                              'কোড পাননি? পুনরায় পাঠান',
                              style: TextStyle(
                                color: _isButtonDisabled ? Colors.grey : AppColors.primary,
                              ),
                            ),
                          ),
                          Text('00:${_start.toString().padLeft(2, '0')} সেকেন্ড'),
                        ],
                      ),
                      Column(
                        children: [
                          CustomButton(
                            text: 'যাচাই করুন',
                            onPressed: () => _onVerifyPressed(context),
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
                                  color: AppColors.primary.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'নিরাপত্তা ও গোপনীয়তা আমাদের সর্বোচ্চ অগ্রাধিকার',
                            style: AppTextStyles.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOtpTextField(BuildContext context, int index) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextField(
        controller: _controllers[index],
        autofocus: index == 0,
        onChanged: (value) {
          if (value.length == 1 && index < 3) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && index > 0) {
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
              borderSide: const BorderSide(width: 2, color: AppColors.primary),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
