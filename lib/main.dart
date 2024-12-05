import 'package:flutter/material.dart';
import 'notification/notification.dart';
// import 'notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationSpamTest(),
    );
  }
}

class NotificationSpamTest extends StatelessWidget {
  const NotificationSpamTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Spam Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            for (int i = 0; i < 135; i++) {
              NotificationService.showNotification(
                i,
                'Notification #$i',
                'This is notification in the spam test.',
              );

              await Future.delayed(const Duration(milliseconds: 400));
            }
          },
          child: const Text('Spam Notifications'),
        ),
      ),
    );
  }
}
