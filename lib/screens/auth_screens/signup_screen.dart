import 'package:dashboard/constants/constant_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/signup_bloc/signup_bloc.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_dimensions.dart';
import '../../constants/constant_icons.dart';
import '../../constants/constant_paths.dart';
import '../../constants/constant_strings.dart';
import '../../reusable_widgets/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
  listener: (context, state) {
   if(state is SignupNavigateState){
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
       child:iconButton(green,
           white,
           transparent,
           white,
           "login to continue",
               (){},
           Icons.check_circle),

     );
     fToast.showToast(child: toast,toastDuration: const Duration(seconds: 1),gravity: ToastGravity.CENTER);
     context.go(ConstantPaths.signInPath);
   }
   if(state is SignupErrorState){
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  authPageRed,
                  authPageOrange,
                ]
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              smallSizedBox(),
              reusableImage(ConstantPaths.signUpImage,AuthPageImage.signUpImageHeight,AuthPageImage.signUpImageWidth),
              smallSizedBox(),
              Container(
                height: AuthPageContainer.signUpContainerHeight,
                width: AuthPageContainer.signUpContainerWidth,
                padding:const EdgeInsets.symmetric(vertical: AuthPageContainer.verticalPadding,horizontal: AuthPageContainer.horizontalPadding),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(AuthPageContainer.borderRadius),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    reusableTextField(StringConstants.name, person, false, _usernameController,StringConstants.typeName),
                    mediumSizedBox(),
                    reusableTextField(StringConstants.email, email, false, _emailController,StringConstants.typeEmail),
                    mediumSizedBox(),
                    reusableTextField(StringConstants.password, lock, true, _passwordController,StringConstants.typePassword),
                    mediumSizedBox(),
                    reusableButton(context, "Sign up", (){
                        context.read<SignupBloc>().add(SignupNavigateEvent(email: _emailController.text, password: _passwordController.text));
                        // _usernameController.clear();
                        // _emailController.clear();
                        // _passwordController.clear();
                                            })
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
}
