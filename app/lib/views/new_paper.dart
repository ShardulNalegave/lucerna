import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucerna/providers/add_paper.dart';
import 'package:lucerna/theme.dart';

// Define state providers for each input field.
final doiProvider = StateProvider<String>((ref) => '');
final titleProvider = StateProvider<String>((ref) => '');
final abstractProvider = StateProvider<String>((ref) => '');

class NewPaperView extends ConsumerWidget {
  const NewPaperView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    // Define InputDecoration theme for text fields.
    InputDecoration inputDecoration(String label) {
      return InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.lightColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        foregroundColor: AppTheme.lightColor,
        titleSpacing: 0.0,
        title: Text(
          'Lucerna',
          style: AppTheme.headingFont.copyWith(color: AppTheme.lightColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Text(
                'Add Paper',
                style: AppTheme.monospaceFont.copyWith(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20),
              // DOI TextField
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("DOI"),
                onChanged: (value) {
                  ref.read(doiProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 20),
              // Title TextField
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Title"),
                onChanged: (value) {
                  ref.read(titleProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 20),
              // Abstract TextField
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Abstract"),
                maxLines: 5,
                onChanged: (value) {
                  ref.read(abstractProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 30),
              // A submit button (optional)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.lightColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () async {
                    final doi = ref.read(doiProvider);
                    final title = ref.read(titleProvider);
                    final abstract = ref.read(abstractProvider);
                    final paper = await ref.read(
                      addPaperProvider(doi, title, abstract).future,
                    );

                    if (paper != null) {
                      context.pop();
                    }
                  },
                  child: Text(
                    'Add',
                    style: AppTheme.bodyFont.copyWith(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
