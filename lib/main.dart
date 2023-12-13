import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_story_app/app/own_stock/screen/own_stock_screen.dart';
import 'package:stock_story_app/app/stock_story/screen/detail_stock_story_screen.dart';
import 'package:stock_story_app/app/stock_story_post/screen/stock_story_post_screen.dart';

void main() {
  runApp(const StockStoryApp());
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const OwnStockScreen(),
  ),
  GoRoute(
      path: '/post-stock-story',
      // builder: (context, state) => const StockStoryPostScreen(),
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const StockStoryPostScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: child,
            );
          },
        );
      }),
  GoRoute(
    path: '/stock-story/:id',
    builder: (context, state) {
      return DetailStockStoryScreen(
        id: int.parse(state.pathParameters['id']!),
      );
    },
  )
]);

class StockStoryApp extends StatelessWidget {
  const StockStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'StockStoryApp',
    );
  }
}
