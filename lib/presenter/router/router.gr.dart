// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../../domain/uimodel/food_ui_model.dart' as _i6;
import '../page/detail/detail_page.dart' as _i2;
import '../page/home/home_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DetailPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          DetailRoute.name,
          path: '/detail-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.DetailPage]
class DetailRoute extends _i3.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i5.Key? key,
    required _i6.FoodUiModel data,
  }) : super(
          DetailRoute.name,
          path: '/detail-page',
          args: DetailRouteArgs(
            key: key,
            data: data,
          ),
        );

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.data,
  });

  final _i5.Key? key;

  final _i6.FoodUiModel data;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, data: $data}';
  }
}
