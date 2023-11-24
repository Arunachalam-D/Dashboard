import 'package:dashboard/constants/constant_icons.dart';
import 'package:dashboard/constants/constant_strings.dart';
import 'package:dashboard/constants/constant_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_dimensions.dart';
import '../../constants/constant_paths.dart';
import '../../reusable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
       if (state is LoginNavigateState) {
         FToast fToast = FToast();
         fToast.init(context);
         Widget toast = Container(
           padding: const EdgeInsets.all(8),
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               gradient: const LinearGradient(
                   begin: Alignment.centerLeft,
                   end: Alignment.centerRight,
                   colors: [
                     green, //(0xFF8A2387)
                     Colors.teal, //(0xFFE94057)
                     // Color(0xFFF19921), //(0xFFF27121)
                     // Color(0xFF9F0191),
                   ])
           ),
           child: const Text("Welcome to Dashboard",style: TextStyle(color: white,fontWeight: FontWeight.bold),),
         );
         fToast.showToast(child: toast,toastDuration: const Duration(seconds: 1),gravity: ToastGravity.TOP);
         final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
         var obtainedEmail = sharedPreferences.getString(StringConstants.typeEmail);

          Router.neglect(context, () => context.go(ConstantPaths.dashboardPath, extra: obtainedEmail,));
        } else if (state is LoginNavigatetoSignUpState) {
             FToast fToast = FToast();
             fToast.init(context);
             Widget toast = Container(
               margin: const EdgeInsets.only(bottom: 160),
               padding: const EdgeInsets.all(8),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                   color:transparent
               ),
               child:iconButton(green,
                   white,
                   transparent,
                   white,
                   "Sign up to access",
                       (){},
                   Icons.check_circle),
             );
             fToast.showToast(child: toast,toastDuration: const Duration(seconds: 1),gravity: ToastGravity.CENTER);

          context.go(ConstantPaths.signUpPath);
        } else if (state is LoginErrorState) {
         FToast fToast = FToast();
         fToast.init(context);
         Widget toast = Container(
          margin: const EdgeInsets.only(bottom: 160),
           padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
           // margin: const EdgeInsets.only(bottom: 22),
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               color: transparent
           ),
           child:iconButton(authPageRed,
               white,
               transparent,
               white,
               ErrorMessages.validDetails,
               (){},
               Icons.error),

         );
         fToast.showToast(child: toast,toastDuration: const Duration(seconds: 1),gravity: ToastGravity.CENTER);
        }
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                authPageRed, //(0xFFE94057)
                authPageOrange, //(0xFFF27121)//
              ])),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                smallSizedBox(),
                reusableImage(ConstantPaths.loginImage, AuthPageImage.signUpImageHeight, AuthPageImage.signUpImageWidth),
                mediumSizedBox(),
                Container(
                  height: AuthPageContainer.loginContainerHeight,
                  width: AuthPageContainer.loginContainerWidth,
                  padding:
                      const EdgeInsets.symmetric(vertical: AuthPageContainer.verticalPadding, horizontal: AuthPageContainer.horizontalPadding),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(AuthPageContainer.borderRadius),
                  ),
                  child: Column(
                    children: [
                      largeSizedBox(),
                      reusableTextField(StringConstants.email, email, false,
                          _emailController, StringConstants.typeEmail),
                      mediumSizedBox(),
                      reusableTextField(StringConstants.password, lock, true,
                          _passwordController, StringConstants.typePassword),
                      mediumSizedBox(),
                      reusableButton(context, "Login", () {
                        // context.read<LoginBloc>().add(LoginLoadingEvent("/dashboard","/"));
                        context.read<LoginBloc>().add(LoginNavigateEvent(
                            email: _emailController.text,
                            password: _passwordController.text));
                        // _emailController.clear();
                        // _passwordController.clear();
                      }),
                      mediumSizedBox(),
                      signUpOption(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          StringConstants.createAccount,
          style: TextStyle(color: black38),
        ),
        GestureDetector(
          onTap: () {
            context.read<LoginBloc>().add(LoginNavigatetoSignupEvent());
          },
          child: const Text(
            StringConstants.signUp,
            style:
                TextStyle(color: black54, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
