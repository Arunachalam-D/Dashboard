import 'package:flutter/material.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_strings.dart';
import '../../../constants/constant_widgets.dart';
import '../../../responsive/responsive.dart';
import 'components/chartData.dart';
import 'components/concepts_covered.dart';
import 'components/header.dart';
import 'components/my_fields.dart';
import 'components/tabledata.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false ,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              // Spacer(flex: 2,),
              smallSizedBox(),
              Header(userName: name,),
              mediumSizedBox(),
              Column(
                children: [
                  const MyFields(),
                  mediumSizedBox(),
                  Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: double.infinity,
                      child: const Text(
                        StringConstants.progress,
                        style: TextStyle(
                            color: textOrange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  smallSizedBox(),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                height: 320,
                                decoration: BoxDecoration(
                                  color: white,
                                  border: Border.all(color: textOrange),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: conceptsCovered(),
                              ),
                              if(Responsive.isMobile(context))Column(
                                children: [
                                  smallSizedBox(),
                                  Container(

                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: textOrange)),
                                    child: const ChartScreen(),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      if(!Responsive.isMobile(context))Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: textOrange)),
                          child: const ChartScreen(),
                        ),
                      ),
                    ],
                  ),
                  mediumSizedBox(),
                  Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: double.infinity,
                      child: const Text(
                        StringConstants.details,
                        style: TextStyle(
                            color: textOrange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  smallSizedBox(),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        courseTable(Responsive.isMobile(context))
                      ],
                    ),
                  ),
                  miniSizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


