import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/controllers/MedicineController.dart';

import '../../../constants.dart';

class AddMedicineField extends StatelessWidget {
  final String fieldProperty,fieldValue,showFieldSuggestions;
  final Function callback;
  const AddMedicineField({Key? key, required this.fieldProperty,required this.fieldValue, required Function this.callback, required this.showFieldSuggestions}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$fieldProperty',overflow: TextOverflow.ellipsis,maxLines: 1),
        SizedBox(height: 1.5),
        TextField(
          onSubmitted: (value){
            context.read<MedicineController>().setSearchText('');
          },
          onChanged: (value){
            callback(value);
            context.read<MedicineController>().setSearchTextFieldName('$fieldProperty');
            context.read<MedicineController>().setSearchText(value);
          },
          decoration: InputDecoration(
            hintText: '$fieldValue',
            fillColor: secondaryColor,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        SizedBox(
          height: defaultPadding/1.5,
        ),
        Visibility(
          visible: context.watch<MedicineController>().searchTextFieldName=='$fieldProperty' && context.watch<MedicineController>().searchText!='f',
          child: SuggestionList()
        ),
      ],
    );
  }
}

class SuggestionList extends StatelessWidget {
  const SuggestionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:4,shrinkWrap:true,itemBuilder: (BuildContext context,int index){
      return Container(
        child: Text('test'),
      );
    });
  }
}

