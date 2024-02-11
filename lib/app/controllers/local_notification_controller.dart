import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rem/app/base/base_rem_controller.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationController extends BaseRemController {
  final _localNotificationApi = FlutterLocalNotificationsPlugin();

  @override
  onInit() {
    super.onInit();
    _initApi();
  }

  Future<void> _initApi() async {
    tz.initializeTimeZones();

    _localNotificationApi
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    _localNotificationApi
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions();

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    await _localNotificationApi.initialize(
      settings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_id_0',
      'Reminder',
      playSound: true,
      importance: Importance.max,
      priority: Priority.max,
    );
    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationApi.show(id, title, body, details);
  }

  Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
    required DateTime date,
    required String payload,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationApi.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        date,
        tz.local,
      ),
      details,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
    logger.d("Configured LN id : $id");
  }

  Future<void> periodicallyShowNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationApi.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.everyMinute,
      details,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {}

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {}

  Future<void> stopNotificationById(int id) async {
    try {
      await _localNotificationApi.cancel(id);
    } catch (err) {
      logger.e(err.toString());
    }
  }
}
