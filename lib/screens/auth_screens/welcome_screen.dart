import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../bloc/screens_bloc/switch_screen_bloc.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_paths.dart';
import '../../constants/constant_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return BlocListener<SwitchScreenBloc, SwitchScreenState>(
  listener: (context, state) {
    if(state is NavigateToLoginFromHomeState){
      context.go(ConstantPaths.signInPath);
    }
    else if(state is NavigateToSignUpFromHomeState){
      context.go(ConstantPaths.signUpPath);
    }
  },
  child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                ConstantPaths.homeImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                color: homeBlack,
                colorBlendMode: BlendMode.darken,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: deepOrange),
                          color: transparent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: const EdgeInsets.all(15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            backgroundColor: transparent),
                        onPressed: () {
                          context.read<SwitchScreenBloc>().add(NavigateToLoginFromHomeEvent());
                        },
                        child:const Text(
                          StringConstants.login,
                          style: TextStyle(color: deepOrange, fontSize: 16),
                        ),
                      )
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(

                    padding: const EdgeInsets.only(left: 10),

                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.08, 10, 10, 10),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          StringConstants.homeLine1,
                          maxLines: 2,
                          style: TextStyle(
                            color: deepOrange,
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Row(
                          children: [
                            StrokeText(
                              text:  StringConstants.homeLine2,
                              textStyle: TextStyle(
                                  fontSize: 44, color: transparent),
                              strokeColor:white,
                              strokeWidth: 1,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              StringConstants.homeLine3,
                              style: TextStyle(
                                color: white,
                                fontSize: 44,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          StringConstants.homeLine4,
                          style: TextStyle(
                            color: white70,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 50),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                              backgroundColor: deepOrange),
                          onPressed: () {context.read<SwitchScreenBloc>().add(NavigateToSignUpFromHomeEvent());},
                          child: const Text(
                            StringConstants.start,
                            style: TextStyle(color:white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    ),
);
  }
}
