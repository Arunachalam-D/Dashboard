import 'dart:typed_data';

import 'package:dashboard/constants/constant_widgets.dart';
import 'package:dashboard/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../bloc/profile_bloc/profile_bloc.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_dimensions.dart';
import '../../../constants/constant_icons.dart';
import '../../../constants/constant_paths.dart';
import '../../../constants/constant_strings.dart';
import '../../../controller/menu_controller.dart';
import '../../../responsive/responsive.dart';
import '../../../reusable_widgets/reusable_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;

  final FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
  listener: (context, state) {
  if(state is UpdateUserState){
      //print("details updated");
      final FToast fToast = FToast();
      fToast.init(context);
      Widget toast = Container(
        margin: const EdgeInsets.fromLTRB(200,0,0 ,390),
       // padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
        // margin: const EdgeInsets.only(bottom: 22),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: transparent
        ),
        child:iconButton(Colors.blue,
            white,
            transparent,
            white,
            StringConstants.detailsAdded,
                (){},
            Icons.check_circle),
               );
      fToast.showToast(child: toast,toastDuration: const Duration(seconds: 1),gravity: ToastGravity.CENTER);


  }
  else if(state is UpdateUserErrorState){
    final FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      margin: const EdgeInsets.fromLTRB(200,0,0 ,390),
      //padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.redAccent
      ),
      child:iconButton(authPageRed,
          white,
          transparent,
          white,
          ErrorMessages.validDetails,
              (){},
          Icons.error),

    );
    fToast.showToast(child: toast ,toastDuration: const Duration(seconds: 1),gravity: ToastGravity.CENTER);

    //print("some error");

  }
  },
  child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // if(Responsive.isMobile(context))
            Row(
              children: [
                if (!Responsive.isDesktop(context))
                  IconButton(
                    onPressed: context.read<MenuAppController>().controlMenu,
                    icon: const Icon(Icons.menu, color: authPageRed),
                  ),
              ],
            ),
            smallSizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 320,
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _image != null ?
                       CircleAvatar(
                        radius: 40.0,
                        backgroundImage: MemoryImage(_image!), // Replace with your avatar image URL
                      ) :
                       const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage(
                          "images/user.png"
                            //ConstantPaths.profileImage
                        ), // Replace with your avatar image URL
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        StringConstants.updateImage, // Replace with your user's name
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: textOrange),
                      ),

                      profileWidthBox(),

                      // Add spacing between text and button
                      ElevatedButton(
                        onPressed: 
                            selectImage
                            ,
                        child: const Text(StringConstants.select),
                      ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 38),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: 320,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        profileWidthBox(),
                        const Text(

                          StringConstants.leaderboard, // Replace with your user's name
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: textOrange),
                        ),

                        profileWidthBox(),

                        // Add spacing between text and button
                      ],
                    ),
                  ),
              ],
            ),
            if (Responsive.isMobile(context))
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 38),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                width: 320,
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profileWidthBox(),
                    const Text(
                      StringConstants.leaderboard, // Replace with your user's name
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: textOrange),
                    ),

                    profileWidthBox(),

                    // Add spacing between text and button
                  ],
                ),
              ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                  //border: Border.all(color: Colors.black54),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    if (!Responsive.isMobile(context))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Profile.height,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: reusableProfileTextField(
                                StringConstants.name,
                                person,
                                false,
                                _usernameController,
                                StringConstants.typeName),
                          ),
                          Container(
                            width: Profile.height,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: reusableProfileTextField(
                                StringConstants.email,
                                email,
                                false,
                                _emailController,
                                StringConstants.typeEmail),
                          ),
                        ],
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.name,
                            person,
                            false,
                            _usernameController,
                            StringConstants.typeName),
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                           const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.email,
                            email,
                            false,
                            _emailController,
                            StringConstants.typeEmail),
                      ),
                    if (!Responsive.isMobile(context))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Profile.height,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: reusableProfileTextField(
                                StringConstants.mobile,
                                mobile,
                                false,
                                _mobileController,
                                StringConstants.typeMobile),
                          ),
                          Container(
                            width: Profile.height,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: reusableProfileTextField(
                                StringConstants.dob,
                                calender,
                                false,
                                _dateController,
                                StringConstants.typeDob),
                          ),
                        ],
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.mobile,
                            mobile,
                            false,
                            _mobileController,
                            StringConstants.typeMobile),
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.dob,
                            calender,
                            false,
                            _dateController,
                            StringConstants.typeDob),
                      ),
                    if (!Responsive.isMobile(context))
                      Container(
                        width: Profile.width,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: reusableProfileTextField(
                            StringConstants.address,
                            location,
                            false,
                            _addressController,
                            StringConstants.typeAddress),
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.address,
                            location,
                            false,
                            _addressController,
                            StringConstants.typeAddress),
                      ),
                    if (!Responsive.isMobile(context))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Profile.height,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: reusableProfileTextField(
                                StringConstants.state,
                                state,
                                false,
                                _stateController,
                                StringConstants.typeState),
                          ),
                          Container(
                            width: Profile.height,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: reusableProfileTextField(
                                StringConstants.pinCode,
                                pin,
                                false,
                                _pinController,
                                StringConstants.typePin),
                          ),
                        ],
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.state,
                            state,
                            false,
                            _stateController,
                            StringConstants.typeState),
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.pinCode,
                            pin,
                            false,
                            _pinController,
                            StringConstants.typePin),
                      ),
                    if (!Responsive.isMobile(context))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Profile.height,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: reusableProfileTextField(
                                StringConstants.qualification,
                                qualification,
                                false,
                                _qualificationController,
                                StringConstants.typeQualification),
                          ),
                          Container(
                            width: Profile.height,
                            margin:const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: reusableProfileTextField(
                                StringConstants.role,
                                role,
                                false,
                                _roleController,
                                StringConstants.typeRole),
                          ),
                        ],
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.qualification,
                            qualification,
                            false,
                            _qualificationController,
                            StringConstants.typeQualification),
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        width: Profile.height,
                        margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: reusableProfileTextField(
                            StringConstants.role,
                            role,
                            false,
                            _roleController,
                            StringConstants.typeRole),
                      ),
                    Container(
                      width: Profile.height,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: reusableButton(context, StringConstants.submit, () {
                        try{
                          context.read<ProfileBloc>().add(UpdateUserEvent(
                              name: _usernameController.text,
                              email: _emailController.text,
                              mobile: _mobileController.text,
                              dob: _dateController.text,
                              address: _addressController.text,
                              state: _stateController.text,
                              pin: _pinController.text,
                              qualification: _qualificationController.text,
                              role: _roleController.text));
                        }
                        catch(e){
                          //print(e);
                        }
                       }

                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ),
);
  }

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });

  }
}



