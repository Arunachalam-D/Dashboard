import 'package:dashboard/constants/constant_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_dimensions.dart';
import '../../../constants/constant_icons.dart';
import '../../../constants/constant_strings.dart';
import '../../../constants/constant_widgets.dart';
import '../../../controller/menu_controller.dart';
import '../../../models/certificates_list.dart';
import '../../../responsive/responsive.dart';
import '../../../reusable_widgets/reusable_widget.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
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
                      ConstantPaths.certificateProfile,
                      height: Profile.height,
                      width: Profile.height,
                    ),
                    smallSizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            DrawerStrings.certificates,
                            style: TextStyle(
                                color: deepOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          // ElevatedButton.icon(
                          //     style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent), onPressed: (){}, icon: const Icon(Icons.add),
                          //     label: const Text("add",style: TextStyle(color: white),)),
                          iconButton(deepOrange, white, transparent, white,
                              StringConstants.add, () {}, add)
                        ],
                      ),
                    ),
                    smallSizedBox(),
                    Responsive(
                      mobile: CertificateInfoCardGridView(
                        crossAxisCount: _size.width < 650 ? 1 : 2,
                        childAspectRatio: _size.width < 650 ? 1 : 1,
                      ),
                      tablet: CertificateInfoCardGridView(
                          crossAxisCount: isTabletScreen ? 2 : 1,
                          childAspectRatio: isTabletScreen ? 1.3 : 1),
                      desktop: CertificateInfoCardGridView(
                        childAspectRatio: _size.width < 1400 ? 1.1 : 1,
                      ),
                    ),
                    smallSizedBox(),

                    iconButton(deepOrange, white, transparent, white,
                        StringConstants.explore, () {}, arrowDown),

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

class CertificateInfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const CertificateInfoCardGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: myCertificates.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 12,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            childAspectRatio: childAspectRatio),
        itemBuilder: (context, index) => CertificateInfoCard(
              info: myCertificates[index],
            ));
  }
}

class CertificateInfoCard extends StatelessWidget {
  const CertificateInfoCard({
    super.key,
    required this.info,
  });

  final CertificateInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            info.path,
            height:AuthPageImage.signUpImageHeight,
            width: double.infinity, // Set width to fill available space
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration:const BoxDecoration(
              color: Colors.black
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  info.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                // const SizedBox(height: 5,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.download,
                      color: textOrange,
                    ),
                    Icon(
                      Icons.share,
                      color: textOrange,
                    )
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
