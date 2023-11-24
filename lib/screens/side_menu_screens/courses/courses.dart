import 'package:dashboard/constants/constant_strings.dart';
import 'package:dashboard/constants/constant_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_dimensions.dart';
import '../../../constants/constant_icons.dart';
import '../../../constants/constant_paths.dart';
import '../../../controller/menu_controller.dart';
import '../../../models/topics_list.dart';
import '../../../responsive/responsive.dart';
import '../../../reusable_widgets/reusable_widget.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final isTabletScreen = _size.width < 1100; //_size.width >= 650 &&

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                if (!Responsive.isDesktop(context))
                  IconButton(
                    onPressed: context.read<MenuAppController>().controlMenu,
                    icon: const Icon(menu, color: authPageRed),
                  ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: transparent,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ConstantPaths.learning,
                      height: Courses.height,
                      width: Courses.width,
                    ),
                    smallSizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                           StringConstants.allCourses,
                            style: TextStyle(
                                color:black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          // ElevatedButton.icon(
                          //     style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent), onPressed: (){}, icon: const Icon(Icons.add),
                          //     label: const Text("add",style: TextStyle(color: white),)),
                          iconButton(deepOrange, white, transparent, white,
                              StringConstants.sort, () {}, sort)
                        ],
                      ),
                    ),
                    smallSizedBox(),
                    //const CourseInfoCardGridView(),
                    Responsive(
                      mobile: CourseInfoCardGridView(childAspectRatio: _size.width < 400 ? 0.7: 0.8,),
                      tablet:  CourseInfoCardGridView(childAspectRatio:(_size.width  < 1200) ? 2 : 5),
                      desktop: CourseInfoCardGridView(childAspectRatio: _size.width > 1200 ? 4.4 :5,), ),
                    smallSizedBox(),
                    // ElevatedButton.icon(
                    //     style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent), onPressed: (){}, icon: const Icon(Icons.arrow_drop_down),
                    //     label: const Text("Explore courses",)),
                    iconButton(deepOrange, white, transparent, white,
                        StringConstants.viewMore, () {}, arrowDown),

                    smallSizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const CourseInfoCardGridView({
    super.key,
    this.crossAxisCount = 1,
    this.childAspectRatio = 5,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: myTopics.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 25,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) => CourseInfoCard(
              info: myTopics[index],
            ));
  }
}

class CourseInfoCard extends StatelessWidget {
  const CourseInfoCard({
    super.key,
    required this.info,
  });

  final TopicInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
        // border: Border.all(width: 1,color: Colors.deepOrangeAccent),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              transparent,
              transparent
            ]),
          border: Border(bottom: BorderSide(
          color: grey,
          width: 1.0,
          ),),
        //borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment:!Responsive.isDesktop(context) ? MainAxisAlignment.center: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(

              children: [
                Image.asset(
                  info.path,
                  height: Courses.containerHeight,
                  width: Courses.containerWidth,
                ), //
                smallSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      star,
                      color:orange,
                    ),
                    miniSizedBox(),
                    Text('|   ${info.rating}')
                  ],
                ),
                if (!Responsive.isDesktop(context))
                Expanded(
                    child: Container(
                    width: Responsive.isMobile(context) ? MediaQuery.of(context).size.width * 0.6 : MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(5),
                      child:Column(
                        children: [
                          Text(
                            info.title,
                            style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          smallSizedBox(),
                          Text(
                            info.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          smallSizedBox(),
                          Text(
                            '${info.sponsor} | ${info.hours}',
                            style: const TextStyle(fontWeight: FontWeight.bold,color: black54),
                          ),

                        ],
                      ),
                    ),
                  ),
                if (!Responsive.isDesktop(context))
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onPressed: () {},
                    child: const Text(StringConstants.startLearning),
                  )
              ],
            ),
          ),
          if (Responsive.isDesktop(context))
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),

              //width:MediaQuery.of(context).size.width * 0.35,
              child:Column(
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    info.title,
                    style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  smallSizedBox(),
                  Text(
                    info.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  smallSizedBox(),
                  Text(
                    '${info.sponsor} | ${info.hours}',
                      style:const  TextStyle(fontWeight: FontWeight.bold,color: black54),
                  ),
                if(Responsive.isMobile(context))
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    onPressed: () {},
                    child: const Text(StringConstants.startLearning),
                  )
                ],
              ),
            ),
          ),
          if (Responsive.isDesktop(context))
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
            onPressed: () {},
            child: const Text(StringConstants.startLearning),
          )
        ],
      ),
    );
  }
}
