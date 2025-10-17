import 'package:conference_bingo/features/board/board_page.dart';
import 'package:conference_bingo/features/home/home_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/board/:hash',
      builder: (context, state) {
        final hash = state.pathParameters['hash']!;
        return BoardPage(boardHash: hash);
      },
    ),
  ],
);
