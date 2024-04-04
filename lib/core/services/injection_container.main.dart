part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _cacheInit();
  await _authInit();
  await _homeInit();
  await _articleInit();
  await _collectionInit();
}

Future<void> _cacheInit() async {
  //final prefs = await SharedPreferences.getInstance();
  final prefsService = SharedPrefsService();
  await prefsService.init();
  final hiveService = HiveStorageService();
  await hiveService.init();
  sl
    ..registerLazySingleton(() => AppStorageService(sl()))
    ..registerLazySingleton<StorageService>(() => prefsService)
    ..registerLazySingleton<HiveStorageService>(() => hiveService);

  final user = await sl<AppStorageService>().getUserInfo();
  final language = await sl<AppStorageService>().getLanguage();
  final themeColor = await sl<AppStorageService>().getThemeColor();

  Cache.instance.user = user;
  Cache.instance.language = language;
  Cache.instance.themeColor = Color(themeColor);

}

Future<void> _authInit() async {
  sl
    ..registerLazySingleton(() => GetUser(sl()))
    ..registerLazySingleton(() => Logout(sl()))
    ..registerLazySingleton(() => Login(sl()))
    ..registerLazySingleton(() => Register(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSrc>(
        () => AuthRemoteDataSrcImpl(sl()))
    ..registerLazySingleton<HttpService>(
        () => DioNetworkService(sl<HiveStorageService>()));
}

Future<void> _homeInit() async {
  sl
    ..registerLazySingleton(() => GetBanner(sl()))
    ..registerLazySingleton(() => GetGuideList(sl()))
    ..registerLazySingleton(() => GetHierarchy(sl()))
    ..registerLazySingleton(() => GetProjectTree(sl()))
    ..registerLazySingleton(() => GetWXArticleTree(sl()))
    ..registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()))
    ..registerLazySingleton<HomeRemoteDataSrc>(
        () => HomeRemoteDataSrcImpl(sl()));
}

Future<void> _articleInit() async {
  sl
    ..registerLazySingleton(() => GetArticles(sl()))
    ..registerLazySingleton(() => GetTops(sl()))
    ..registerLazySingleton(() => GetHierarchyArticles(sl()))
    ..registerLazySingleton(() => GetProjectArticles(sl()))
    ..registerLazySingleton(() => GetSearchArticles(sl()))
    ..registerLazySingleton(() => GetWxArticles(sl()))

    ..registerLazySingleton<ArticleRepo>(() => ArticleRepoImpl(sl()))
    ..registerLazySingleton<ArticleRemoteDataSrc>(
        () => ArticleRemoteDataSrcImpl(sl()));
}

Future<void> _collectionInit() async {
  sl
    ..registerLazySingleton(() => GetCollectArticles(sl()))
    ..registerLazySingleton(() => CollectArticle(sl()))
    ..registerLazySingleton(() => UncollectArticle(sl()))
    ..registerLazySingleton(() => UncollectMyArticle(sl()))
    ..registerLazySingleton<CollectionRepo>(() => CollectionRepoImpl(sl()))
    ..registerLazySingleton<CollectionRemoteDataSrc>(
        () => CollectionRemoteDataSrcImpl(sl()));
}
