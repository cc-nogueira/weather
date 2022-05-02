import 'package:_domain_layer/domain_layer.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../common/page/message_page.dart';
import '../common/widget/page_transitions.dart';
import '../feature/city/page/city_page.dart';
import '../feature/weather/one_call_weather/page/one_call_weather_page.dart';
import '../feature/weather/weather_list/page/weather_list_page.dart';

/// Routes management class.
///
/// Uses static const variables to enumerate available routes and implements
/// onGenerateRoute callback used for named routes navigation.
class Routes {
  const Routes();

  static const home = '/';
  static const weather = '/weather';
  static const city = '/city';

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _route((_) => const WeatherListPage());
      case weather:
        return PageRouteBuilderWithFadeTransition(
          settings: settings,
          pageBuilder: (context, _, __) => _argumentBuilder<Tuple2<City, Weather>>(
              context,
              settings.arguments,
              (context, args) => OneCallWeatherPage(city: args.item1, weather: args.item2)),
        );

      case city:
        return _route((_) => CityPage());
      default:
        return _route(
          (_) => MessagePage.error('Unknown route "${settings.name}"'),
        );
    }
  }

  Route _route(Widget Function(BuildContext context) builder) =>
      MaterialPageRoute(builder: builder);

  // ignore: unused_element
  Route _routeWithArg<T>(Object? arg, Widget Function(BuildContext, T) builder) =>
      MaterialPageRoute(
        builder: (context) => _argumentBuilder<T>(context, arg, builder),
      );

  Widget _argumentBuilder<T>(
          BuildContext context, Object? arg, Widget Function(BuildContext, T) builder) =>
      arg is T ? builder(context, arg) : MessagePage.error('Illegal argument for route');
}
