import 'package:dashboard/constants/constant_colors.dart';
import 'package:flutter/material.dart';

ElevatedButton iconButton(
    Color backgroundColor,
    Color textColor,
    Color borderColor,
    Color iconColor,
    String text,
    Function onTap,
    IconData icon) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: borderColor, // Set the border color here
          width: 0.75, // Set the border width as needed
        ), // Adjust the border radius as needed
      ),
    ),
    onPressed: () {
      onTap();
    },
    icon: Icon(
      icon,
      color: iconColor,
    ),
    label: Text(
      text,
      style: TextStyle(color: textColor),
    ),
  );
}

Image reusableImage(String imageName, double height, double width) {
  return Image.asset(
    imageName,
    height: height,
    width: width,
  );
}

TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, String type) {
  bool _autoValidate = false;
  bool mail = false;
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: white,
    style: const TextStyle(color: black54),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: purple,
      ),
      labelText: text,
      labelStyle: const TextStyle(color:black38),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: black12,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: (value) {
      _autoValidate = true;
    },
    validator: (value) {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value!);

      if (value!.isEmpty) {
        return 'Enter $type';
      } else if (type == "email" && !emailValid) {
        return "Enter Valid Email";
      } else if (type == "password" && controller.text.length < 8) {
        return "Password must be atLeast 8 characters";
      } else if (type == "name" && controller.text.length < 3) {
        return "Username must be atLeast 3 characters";
      }
      mail = true;
      return null;
    },
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextFormField reusableProfileTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, String type) {
  bool _autoValidate = false;
  bool mail = false;
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: white,
    style: const TextStyle(color: black54),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: purple,

      ),
      labelText: text,
      labelStyle: const TextStyle(color:black38),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: black12,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: (value) {
      _autoValidate = true;
    },
    validator: (value) {
      bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value!);
      bool numberValid = RegExp(r'[0-9]').hasMatch(value!);
      bool dateValid = RegExp(r'[0-9/-]').hasMatch(value!);

      if (value!.isEmpty) {
        return 'Enter $type';
      } else if (type == "email" && !emailValid) {
        return "Enter Valid Email";
      } else if (type == "password" && controller.text.length < 8) {
        return "Password must be atLeast 8 characters";
      } else if (type == "name" && controller.text.length < 3) {
        return "Username must be atLeast 3 characters";
      }
      else if (type == "mobile" && !numberValid) {
        return "Enter only number";
      }
      else if (type == "mobile" && controller.text.length < 10) {
        return "Enter proper contact number";
      }
      else if (type == "pin" && !numberValid) {
        return "Enter proper pin number";
      }
      else if (type == "pin" && controller.text.length < 6) {
        return "Pin must be of 6 digits";
      }
      else if (type == "dob" && !dateValid) {
        return "Enter in DD/MM/YY format";
      }
      mail = true;
      return null;
    },
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container reusableButton(BuildContext context, String type, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF4A1870), //(0xFF8A2387)
              Color(0xFFE94057), //(0xFFE94057)
              // Color(0xFFF19921), //(0xFFF27121)
              // Color(0xFF9F0191),
            ])),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
      child: Text(
        type,
        style: const TextStyle(fontWeight: FontWeight.bold,color: white),
      ),
    ),
  );
}
