import 'package:dashboard/screens/side_menu_screens/profile/profile_screen.dart';
import 'package:dashboard/screens/auth_screens/welcome_screen.dart';
import 'package:dashboard/screens/dashboard_screens/main/main_screen.dart';
import 'package:dashboard/screens/side_menu_screens/certificate/certificates.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constant_paths.dart';
import '../constants/constant_strings.dart';
import '../screens/auth_screens/signin_screen.dart';
import '../screens/auth_screens/signup_screen.dart';

class MyAppRouter{

  GoRouter router = GoRouter(
   initialLocation: "/",
    routerNeglect: true,
    routes: [

    GoRoute(
          name: "certificates",
          path: "/certificates",
          builder: (context,state){
           return const CertificateScreen();
          }
      ),
      GoRoute(
          name: "home",
          path: "/",
          builder: (context,state){
            return const WelcomeScreen();
          }
      ),
    GoRoute(
      name: StringConstants.dashboard,
      path: ConstantPaths.dashboardPath,
      // redirect: (context,State),
      builder: (context,state) {
       var dynamicName = state.extra.toString();
       //  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
       //  var obtainedEmail = sharedPreferences.getString(StringConstants.typeEmail);
        // Return the HomeScreen widget with the dynamic name
        return HomeScreen(name: dynamicName);
     // return HomeScreen(name: "",);
        }
    ),
    GoRoute(
        name: StringConstants.signIn,
        path: ConstantPaths.signInPath,
        builder: (context,state)=>const SignInScreen()
    ),
    GoRoute(
        name: StringConstants.signUp,
        path: ConstantPaths.signUpPath,
        builder: (context,state)=>const SignUpScreen()
    ),
      GoRoute(
          name: "profile",
          path: "/profile",
          builder: (context,state)=>const ProfileScreen()
      ),


  ],

    redirect: (context,state) async{
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var obtainedEmail = sharedPreferences.getString(StringConstants.typeEmail);
      print(obtainedEmail);
      if( obtainedEmail == null && state.matchedLocation == "/"){
        return "/";
      }
      if( obtainedEmail == null && state.matchedLocation == ConstantPaths.signInPath){
        return ConstantPaths.signInPath;
      }
      else if(obtainedEmail == null && state.matchedLocation == ConstantPaths.signUpPath){
        return ConstantPaths.signUpPath;
      }
      else if(obtainedEmail!.isNotEmpty){
        return ConstantPaths.dashboardPath;
      }
      else if(obtainedEmail!.isNotEmpty && state.matchedLocation == ConstantPaths.dashboardPath){
        return ConstantPaths.dashboardPath;
      }
      // else if(AuthenticationStatus.isAuthenticated  && state.matchedLocation == ConstantPaths.dashboardPath){
      //   return ConstantPaths.dashboardPath;
      // }

      else if(obtainedEmail == null && state.matchedLocation == ConstantPaths.dashboardPath){
        return ConstantPaths.signInPath;
      }

      else if(obtainedEmail!.isNotEmpty && state.matchedLocation == "/profile"){
        return "/profile";
      }
      // else if(AuthenticationStatus.isAuthenticated  && state.matchedLocation == "/profile"){
      //   return "/profile";
      // }

      else if(obtainedEmail == null && state.matchedLocation == "/profile"){
        return ConstantPaths.signInPath;
      }

      else if(obtainedEmail!.isNotEmpty && state.matchedLocation == "/certificates"){
        return "/certificates";
      }
      // else if(AuthenticationStatus.isAuthenticated  && state.matchedLocation == "/certificates"){
      //   return "/certificates";
      // }

      else if(obtainedEmail == null && state.matchedLocation == "/certificates"){
        return ConstantPaths.signInPath;
      }
      return null;

    },

  );
}

