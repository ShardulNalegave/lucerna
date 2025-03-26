import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucerna/models/paper.dart';
import 'package:lucerna/providers/paper_finder.dart';
import 'package:lucerna/theme.dart';

class ResultsView extends ConsumerWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = GoRouterState.of(context);
    final query = state.extra as String;
    final AsyncValue<List<Paper>> similarPapers = ref.watch(
      findPapersProvider(query),
    );

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
                SizedBox(height: 15),
                Text(
                  'You asked for',
                  style: AppTheme.monospaceFont.copyWith(
                    color: Colors.white60,
                    fontSize: 15,
                  ),
                ),
                Text(
                  query,
                  style: AppTheme.monospaceFont.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 25),
                switch (similarPapers) {
                  AsyncLoading() => Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.lightColor,
                    ),
                  ),
                  AsyncData(:final value) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final paper in value)
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: GestureDetector(
                              onTap: () => context.push('/paper', extra: paper),
                              child: Material(
                                color: AppTheme.lightColor.withAlpha(200),
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        paper.title,
                                        style: AppTheme.bodyFont.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        paper.doi,
                                        style: AppTheme.monospaceFont.copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  AsyncError(:final error) => Text(
                    'Oops, something unexpected happened ${error.toString()}',
                  ),
                  _ => const CircularProgressIndicator(),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
