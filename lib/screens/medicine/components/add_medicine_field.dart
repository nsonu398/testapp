import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AddMedicineField extends StatelessWidget {
  final String property;
  final Function callback;
  const AddMedicineField({Key? key, required this.property, required Function this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$property',overflow: TextOverflow.ellipsis,maxLines: 1,),
        TextField(
          onChanged: (value){
            callback(value);
          },
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
