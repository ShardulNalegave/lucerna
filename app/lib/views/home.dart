import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucerna/components/query_input.dart';
import 'package:lucerna/theme.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              SvgPicture.asset('assets/lucerna_logo.svg'),
              SizedBox(height: 15),
              Text(
                "Lucerna",
                style: AppTheme.headingFont.copyWith(
                  color: AppTheme.lightColor,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Discover the Papers\nThat Light Your Path',
                style: AppTheme.monospaceFont.copyWith(
                  color: Colors.white60,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: QueryInput(
                        onSend: (text) {
                          context.push('/results', extra: text);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      onPressed: () {
                        context.push('/paper/new');
                      },
                      backgroundColor: AppTheme.lightColor,
                      foregroundColor: AppTheme.backgroundColor,
                      splashColor: AppTheme.lightColor.withAlpha(200),
                      child: Icon(Icons.add),
                    ),
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
