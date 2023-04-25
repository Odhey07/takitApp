import 'package:flutter/material.dart';
import 'package:tak_it_app/widgets/style/theme.dart';

/**
 * custom du formulaire
 */
Widget CustomTextFormField({
  required TextEditingController? controller,
  GestureTapCallback? onTap,
  required TextInputType? keyboardType,
  ValueChanged<String>? onFieldSubmitted,
  required FormFieldValidator<String>? validator,
  required Widget? prefixIcon,
  required String? label,
}) {
  return TextFormField(
    controller: controller,
    onTap: onTap,
    keyboardType: keyboardType,
    onFieldSubmitted: onFieldSubmitted,
    validator: validator,
    decoration: InputDecoration(
      fillColor: blanc,
      prefixIconColor: rose,
      prefixIcon: prefixIcon,
      labelText: label,


      border: OutlineInputBorder(
        borderSide: BorderSide(color: rose),
        borderRadius: BorderRadius.circular(30),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: rose, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.red)
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: rose)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: rose, width: 1,),
      ),

    ),
  );
}

//background image
Decoration arrierePlan() {
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage("lib/assets/images/Plan_bg_app_rouge.png"),
        fit: BoxFit.cover),
  );
}

//Texte Personnalisé
Text customsText(String data, Color, FontWeight, FontFamily, double FontSize) {
  return Text(
    data,
    style: TextStyle(
      color: Color,
      fontWeight: FontWeight,
      fontFamily: FontFamily,
      fontSize: FontSize,
    ),
  );
}
