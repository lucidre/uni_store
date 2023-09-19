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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../common_libs.dart' as _i8;
import '../models/store_item/store_item.dart' as _i9;
import '../presentations/add_success/add_success_screen.dart' as _i4;
import '../presentations/detail_screen/details_screen.dart' as _i3;
import '../presentations/main_screen/main_screen.dart' as _i2;
import '../presentations/splash/splash_screen.dart' as _i1;
import 'app_router.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        transitionsBuilder: _i7.fadePageBuilder,
        durationInMilliseconds: 600,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.MainScreen(
          key: args.key,
          isViewSaved: args.isViewSaved,
        ),
        transitionsBuilder: _i7.fadePageBuilder,
        durationInMilliseconds: 600,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.DetailsScreen(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: _i7.fadePageBuilder,
        durationInMilliseconds: 600,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<AddSuccessRouteArgs>();
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.AddSuccessScreen(
          key: args.key,
          storeItem: args.storeItem,
          variety: args.variety,
        ),
        transitionsBuilder: _i7.fadePageBuilder,
        durationInMilliseconds: 600,
        reverseDurationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          MainRoute.name,
          path: '/main-screen',
        ),
        _i5.RouteConfig(
          DetailsRoute.name,
          path: '/details-screen',
        ),
        _i5.RouteConfig(
          AddSuccessRoute.name,
          path: '/add-success-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i5.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i8.Key? key,
    bool isViewSaved = false,
  }) : super(
          MainRoute.name,
          path: '/main-screen',
          args: MainRouteArgs(
            key: key,
            isViewSaved: isViewSaved,
          ),
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    this.isViewSaved = false,
  });

  final _i8.Key? key;

  final bool isViewSaved;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, isViewSaved: $isViewSaved}';
  }
}

/// generated route for
/// [_i3.DetailsScreen]
class DetailsRoute extends _i5.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i8.Key? key,
    required _i9.StoreItem model,
  }) : super(
          DetailsRoute.name,
          path: '/details-screen',
          args: DetailsRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.model,
  });

  final _i8.Key? key;

  final _i9.StoreItem model;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i4.AddSuccessScreen]
class AddSuccessRoute extends _i5.PageRouteInfo<AddSuccessRouteArgs> {
  AddSuccessRoute({
    _i8.Key? key,
    required _i9.StoreItem storeItem,
    required _i9.StoreVariety variety,
  }) : super(
          AddSuccessRoute.name,
          path: '/add-success-screen',
          args: AddSuccessRouteArgs(
            key: key,
            storeItem: storeItem,
            variety: variety,
          ),
        );

  static const String name = 'AddSuccessRoute';
}

class AddSuccessRouteArgs {
  const AddSuccessRouteArgs({
    this.key,
    required this.storeItem,
    required this.variety,
  });

  final _i8.Key? key;

  final _i9.StoreItem storeItem;

  final _i9.StoreVariety variety;

  @override
  String toString() {
    return 'AddSuccessRouteArgs{key: $key, storeItem: $storeItem, variety: $variety}';
  }
}
