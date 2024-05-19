import 'package:flexify_client_app/cache/cache_manager.dart';
import 'package:flexify_client_app/views/appointment_detail/appointment_detail_view.dart';
import 'package:flexify_client_app/views/consultant_detail/consultant_detail_view.dart';
import 'package:flexify_client_app/views/main/main_view.dart';
import 'package:flexify_client_app/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  CacheManager().setApiKey(
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI3ODc2YWNlMy03NGMzLTRhODQtYjJkOS1lMTEzMTMwZmE1N2EiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImQ2Y2VkZTQwLWQ3NzMtNGQ2ZC02MDM1LTA4ZGM1NzQyYTc0ZiIsImVtYWlsIjoiaGFzYW5rYXlhQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJleHAiOjE3MTU4MDQ5OTEsImlzcyI6ImZsZXhpZnlAZmxleGlmeS5jb20iLCJhdWQiOiJmbGV4aWZ5QGZsZXhpZnkuY29tIn0.C8TdxItxWBKWPZHs43MMRsyThqLcb59NznzAekLHbME");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flexify Client App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: SplashView(),
      home: SplashView(),
    );
  }
}
