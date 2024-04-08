part of 'router.dart';

//part 'router.g.dart';

/// For routes that should NOT have the bottom nav bar
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// For routes that SHOULD have the bottom nav bar
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  onException: (_, GoRouterState state, GoRouter router) {
    //router.go('/a', extra: state.uri.toString());
  },
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        redirect: (context, state) {
          /// for app require login:
          /// First we check if session exists and user exists, if either is
          /// missing, we check if they're first timers, because their session
          /// could be gone but they aren't first timers, so, we take them to
          /// login, but if they are first timers, we return null which pushes us
          /// to the builder
          if (state.extra == 'home') return '/home';
          return null;
        },
        builder: (context, state) {
          /// Now that we're here, we check again if the user is first timer,
          /// so, if they were first timer from that push in the redirect,
          /// then we catch it here and take em to onboarding, else, we go
          /// ahead and check if when we pushed to '/', we added the <home>
          /// extra, if we did, then we were trying to go home, else, we just
          /// go to the splashscreen, where the OTP gets verified, if it's
          /// still valid, we go home, else, we go back to login.
          if (Cache.instance.appInstallStatus == AppInstallStatus.newInstall ||
              Cache.instance.appInstallStatus == AppInstallStatus.upgrade) {
            return const OnBoardingScreen();
          }
          return const SplashScreen();
        }),

    /// Application shell
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        // Return the widget that implements the custom shell (in this case
        // using a BottomNavigationBar). The StatefulNavigationShell is passed
        // to be able access the state of the shell and to navigate to other
        // branches in a stateful way.
        return DashboardScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
            routes: const <RouteBase>[],
          ),
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/hierarchy',
            builder: (BuildContext context, GoRouterState state) {
              return const HierarchyScreen();
            },
            routes: const <RouteBase>[],
          ),
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/wxarticle',
            builder: (BuildContext context, GoRouterState state) {
              return const WXArticleScreen();
            },
            routes: const <RouteBase>[],
          ),
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/guide',
            builder: (BuildContext context, GoRouterState state) {
              return const GuideScreen();
            },
            routes: const <RouteBase>[],
          ),
        ]),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: '/project',
            builder: (BuildContext context, GoRouterState state) {
              return const ProjectScreen();
            },
            routes: const <RouteBase>[],
          ),
        ]),
      ],
    ),
    GoRoute(
      path: '/hierarchy/:sectionId',
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, state) => HierarchyArticlesScreen(
        sectionId: int.parse(state.pathParameters['sectionId'] as String),
        cateId: int.parse(state.uri.queryParameters['cateId'] as String),
      ),
    ),
    GoRoute(
      path: '/settings',
      parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'language',
          parentNavigatorKey: rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsLanguageScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/webview',
      parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        final title = state.uri.queryParameters["title"] ?? "";
        final url = state.uri.queryParameters["url"] ?? "";
        return WebViewScreen(title: title, url: url);
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/login',
      parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/register',
      parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/collection',
      parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return CollectionScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/coin-detail',
      parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const CoinDetailsScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/about',
      parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const AboutScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: '/search',
      parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return const SearchScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'result',
          parentNavigatorKey: rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            final key = state.uri.queryParameters["key"] ?? "";
            return SearchResultScreen(k: key);
          },
        ),
      ],
    ),
  ],
);
