import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucerna/models/paper.dart';
import 'package:lucerna/theme.dart';

class PaperView extends ConsumerWidget {
  const PaperView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final paper = state.extra as Paper;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

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
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                Text(
                  paper.doi,
                  style: AppTheme.monospaceFont.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  paper.title,
                  style: AppTheme.monospaceFont.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  paper.abstract,
                  style: AppTheme.bodyFont.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
