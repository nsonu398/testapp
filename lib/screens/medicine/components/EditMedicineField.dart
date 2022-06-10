import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EditMedicineField extends StatelessWidget {
  final String property;
  final Function callback;
  const EditMedicineField({Key? key, required this.property, required Function this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofocus: true,
          onFieldSubmitted: (v){
            callback(v);
          },
          decoration: InputDecoration.collapsed(fillColor: Colors.indigo.withOpacity(0), hintText: ''),
          initialValue: '$property',
        ),
        SizedBox(height: 2),
        TextField(
          decoration: InputDecoration(
            hintText: '$property',
            fillColor: secondaryColor,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding,
        )
      ],
    );
  }
}
