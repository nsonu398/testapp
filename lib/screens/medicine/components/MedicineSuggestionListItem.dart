import 'package:flutter/material.dart';

import '../../../constants.dart';

class MedicineSuggestionListItem extends StatelessWidget {
  const MedicineSuggestionListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: defaultPadding),
      decoration: BoxDecoration(color: secondaryColor,borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex:6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medicine name',style: Theme.of(context).textTheme.bodyMedium,),
                Text('Company name',style: Theme.of(context).textTheme.bodyMedium),
                Text('Type',style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Amount in mg or ml',style: Theme.of(context).textTheme.bodyMedium),
                Text('Price per pack',style: Theme.of(context).textTheme.bodyMedium),
                Text('',style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          )
        ],
      ),
    );
  }
}
