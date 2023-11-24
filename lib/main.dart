import 'package:dashboard/routes/app_route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/login_bloc/login_bloc.dart';
import 'bloc/logout_bloc/logout_bloc.dart';
import 'bloc/profile_bloc/profile_bloc.dart';
import 'bloc/screens_bloc/switch_screen_bloc.dart';
import 'bloc/signup_bloc/signup_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDx_y99oi124v5LAOZV8dqeWSApMmKhmRE",
          appId: "1:358230257243:web:4fae4d9dcca97081e2d97e",
          messagingSenderId: "358230257243",
          projectId: "signin-page-b6bcd"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
          BlocProvider<SignupBloc>(
            create: (context) => SignupBloc(),
          ),
          BlocProvider<LogoutBloc>(
            create: (context) => LogoutBloc(),
          ),
          BlocProvider<SwitchScreenBloc>(
              create: (context) => SwitchScreenBloc()),
          BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: MyAppRouter().router,
        ),
      ),
    );
  }
}
