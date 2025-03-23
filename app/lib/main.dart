import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucerna/router.dart';

void main() {
  runApp(const Lucerna());
}

class Lucerna extends StatelessWidget {
  const Lucerna({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Lucerna',
        routerConfig: router,
      ),
    );
  }
}
