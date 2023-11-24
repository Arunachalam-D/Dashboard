import 'package:dashboard/constants/constant_colors.dart';
import 'package:dashboard/constants/constant_strings.dart';
import 'package:dashboard/constants/constant_widgets.dart';
import 'package:dashboard/models/my_learning.dart';
import 'package:dashboard/responsive/responsive.dart';
import 'package:flutter/material.dart';
import '../../../../constants/constant_dimensions.dart';
import '../../../../constants/constant_icons.dart';
import '../../../../reusable_widgets/reusable_widget.dart';

class MyFields extends StatelessWidget {
  const MyFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "",
                style: TextStyle(
                    color: textOrange,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: iconButton(white, deepOrange, deepOrange, deepOrange,
                  StringConstants.view, () {}, play),
            ),
          ],
        ),
        smallSizedBox(),
        Responsive(
            mobile: CourseInfoCardGridView(crossAxisCount: _size.width < 650 ? 2: 4,childAspectRatio: _size.width < 650 ? 1: 1,),
            tablet: const CourseInfoCardGridView(),
            desktop: CourseInfoCardGridView(childAspectRatio: _size.width < 1400 ? 1.1 :1.4,), )
      ],
    );
  }
}

class CourseInfoCardGridView extends StatelessWidget {
  const CourseInfoCardGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: myCourses.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 12,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) => CourseInfoCard(
              info: myCourses[index],
            ));
  }
}

class CourseInfoCard extends StatelessWidget {
  const CourseInfoCard({
    super.key,
    required this.info,
  });

  final LearningInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              textOrange, //(0xFF8A2387)
              authPageRed, //(0xFFE94057)
            ]),
        borderRadius: Cards.circularAllRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.more_vert,
                color: Colors.white70,
                size: 23,
              ),
            ],
          ),
          Text(
            info.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          ProgressLine(
            percentage: info.percentage,
          ),
          Row(
            children: [
              Text(
                "${info.percentage}% - completed",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          iconButton(white, deepOrange, transparent, deepOrange,
              StringConstants.resume, () {}, play),
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    super.key,
    required this.percentage,
  });

  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Cards.height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: white12,
            borderRadius: Cards.circleRadius,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            height: Cards.height,
            width: constraints.maxWidth * (percentage / 100),
            decoration: BoxDecoration(
              color: white70,
              borderRadius: Cards.circleRadius,
            ),
          ),
        )
      ],
    );
  }
}
