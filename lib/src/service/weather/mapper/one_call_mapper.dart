import '../../../domain_layer.dart';
import '../model/one_call_weather_model.dart';

/// CityMapper converts [OneCallWeatherModel] to [OneCallWeather] entity.
///
/// This is a one-way only conversion. Only from Model to Entity.
class OneCallMapper {
  /// Const constructor.
  const OneCallMapper();

  /// Maps a OneCallWeather service Model to a [OneCallWeather] domain Entity.
  OneCallWeather mapEntity(OneCallWeatherModel model) {
    final currentModel = model.current;
    final currentWeather = currentModel.weather.first;
    final today = model.daily.isEmpty ? null : model.daily.first;

    final conditions = Conditions(
      code: currentWeather.id,
      title: currentWeather.main,
      description: currentWeather.description,
      humidity: currentModel.humidity,
      pressure: currentModel.pressure,
      clouds: currentModel.clouds,
      temperatures: Temperatures(
        temperature: Celcius(currentModel.temp),
        feelsLike: Celcius(currentModel.feelsLike),
        min: today == null ? null : Celcius(today.temp.min),
        max: today == null ? null : Celcius(today.temp.max),
      ),
      wind: Wind(
        speed: currentModel.windSpeed,
        gust: currentModel.windGust,
        directionFrom: currentModel.windDegree,
      ),
      rain1h: currentModel.rain?.h1,
      snow1h: currentModel.snow?.h1,
    );

    final geo = Geo(
      location: Location(latitude: model.lat, longitude: model.lon),
      timeZone: model.timezone,
      timeShiftMillis: model.timezoneOffset * 1000,
      sunriseMillis: currentModel.sunrise * 1000,
      sunsetMillis: currentModel.sunset * 1000,
    );

    final weather = Weather(
      dateTimeMillis: currentModel.dt * 1000,
      geo: geo,
      conditions: conditions,
    );

    return OneCallWeather(
      weather: weather,
      daily: _mapDaily(model.daily, geo),
      hourly: _mapHourly(model.hourly, geo),
      alerts: _mapAlerts(model.alerts, geo),
    );
  }

  /// Internal - maps a list of [HourlyModel] to a list of [HourlyWeather] entities.
  List<HourlyWeather> _mapHourly(List<HourlyModel> hourlyModels, Geo geo) {
    final list = <HourlyWeather>[];
    for (final model in hourlyModels) {
      final weatherModel = model.weather.first;
      final hourly = HourlyWeather(
        dateTimeMillis: model.dt * 1000,
        geo: geo,
        conditions: Conditions(
          code: weatherModel.id,
          title: weatherModel.main,
          description: weatherModel.description,
          humidity: model.humidity,
          pressure: model.pressure,
          clouds: model.clouds,
          temperatures: Temperatures(
            temperature: Celcius(model.temp),
            feelsLike: Celcius(model.feelsLike),
          ),
          wind: Wind(
            speed: model.windSpeed,
            gust: model.windGust,
            directionFrom: model.windDegree,
          ),
          pop: model.pop,
          rain1h: model.rain?.h1,
          snow1h: model.snow?.h1,
        ),
      );
      list.add(hourly);
    }
    return list;
  }

  /// Internal - maps a list of [DailyModel] to a list of [DailyWeather] entities.
  List<DailyWeather> _mapDaily(List<DailyModel> dailyModels, Geo geo) {
    final list = <DailyWeather>[];
    for (final model in dailyModels) {
      final weatherModel = model.weather.first;
      final daily = DailyWeather(
        dateTimeMillis: model.dt * 1000,
        geo: Geo(
          location: geo.location,
          timeZone: geo.timeZone,
          timeShiftMillis: geo.timeShiftMillis,
          sunriseMillis: model.sunrise * 1000,
          sunsetMillis: model.sunset * 1000,
          moonriseMillis: model.moonrise * 1000,
          moonsetMillis: model.moonset * 1000,
          moonPhase: model.moonPhase,
        ),
        conditions: DailyConditions(
          code: weatherModel.id,
          title: weatherModel.main,
          description: weatherModel.description,
          humidity: model.humidity,
          pressure: model.pressure,
          clouds: model.clouds,
          dailyTemperatures: DailyTemperatures(
            day: Celcius(model.temp.day),
            night: Celcius(model.temp.night),
            evening: Celcius(model.temp.eve),
            morning: Celcius(model.temp.morn),
          ),
          dailyFeelsLike: DailyTemperatures(
            day: Celcius(model.feelsLike.day),
            night: Celcius(model.feelsLike.night),
            evening: Celcius(model.feelsLike.eve),
            morning: Celcius(model.feelsLike.morn),
          ),
          dailyMin: Celcius(model.temp.min),
          dailyMax: Celcius(model.temp.max),
          wind: Wind(
            speed: model.windSpeed,
            gust: model.windGust,
            directionFrom: model.windDegree,
          ),
          pop: model.pop,
          rain: model.rain,
          snow: model.snow,
        ),
      );
      list.add(daily);
    }
    return list;
  }

  /// Internal - maps a list of [AlertModel] to a list of [Alert] entities.
  List<Alert> _mapAlerts(List<AlertModel> alertModels, Geo geo) {
    final alerts = <Alert>[];
    for (final model in alertModels) {
      final alert = Alert(
        senderName: model.senderName,
        event: model.event,
        startMillis: model.start * 1000,
        endMillis: model.end * 1000,
        description: model.description,
        tags: model.tags,
        geo: geo,
      );
      alerts.add(alert);
    }
    return alerts;
  }
}
