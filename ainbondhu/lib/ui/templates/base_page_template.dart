import 'package:flutter/material.dart';
import 'package:ainbondhu/utils/app_theme.dart';

/// A standard scaffold template for all pages in the app.
/// Handles common features like:
/// - Loading overlays
/// - Error banners
/// - Standard App Bar
/// - SafeArea
class BasePageTemplate extends StatelessWidget {
  final String title;
  final Widget body;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback? onErrorDismissed;
  final bool showAppBar;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Color backgroundColor;

  const BasePageTemplate({
    super.key,
    required this.body,
    this.title = '',
    this.isLoading = false,
    this.errorMessage,
    this.onErrorDismissed,
    this.showAppBar = true,
    this.actions,
    this.floatingActionButton,
    this.backgroundColor = AppColors.backgroundLight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: showAppBar
          ? AppBar(
              title: Text(title, style: AppTextStyles.headlineSmall),
              centerTitle: true,
              actions: actions,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
            )
          : null,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                if (errorMessage != null)
                  _ErrorBanner(
                    message: errorMessage!,
                    onDismiss: onErrorDismissed,
                  ),
                Expanded(child: body),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback? onDismiss;

  const _ErrorBanner({required this.message, this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.redAccent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (onDismiss != null)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: onDismiss,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }
}
