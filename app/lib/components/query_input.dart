import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucerna/theme.dart';

final queryInputProvider = StateProvider<String>((ref) => '');

class QueryInput extends ConsumerWidget {
  final void Function(String) onSend;

  const QueryInput({super.key, required this.onSend});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(queryInputProvider);

    void handleSend() {
      final trimmed = text.trim();
      if (trimmed.isNotEmpty) {
        onSend(trimmed);
        ref.read(queryInputProvider.notifier).state = '';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade900, // Dark background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Ask anything...",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                ),
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: text,
                    selection: TextSelection.collapsed(offset: text.length),
                  ),
                ),
                onChanged:
                    (value) =>
                        ref.read(queryInputProvider.notifier).state = value,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: AppTheme.lightColor),
            onPressed: handleSend,
          ),
        ],
      ),
    );
  }
}
