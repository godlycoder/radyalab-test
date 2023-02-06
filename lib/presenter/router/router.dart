import 'package:auto_route/annotations.dart';
import 'package:list_foods/presenter/page/detail/detail_page.dart';
import 'package:list_foods/presenter/page/home/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: DetailPage),
  ],
)
class $AppRouter {}