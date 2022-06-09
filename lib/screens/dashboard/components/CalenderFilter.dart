import 'package:testapp/constants.dart';
import 'package:testapp/controllers/DashboardController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalenderFilter extends StatelessWidget {
  const CalenderFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: secondaryColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            onTap: (){
              context.read<DashboardController>().setCalenderFilter(0);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              padding: EdgeInsets.all(3.5),
              decoration: BoxDecoration(
                color:  context.watch<DashboardController>().calenderFilter==0?Colors.green:secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text('Day')
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            onTap: (){
              context.read<DashboardController>().setCalenderFilter(1);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                padding: EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                    color:  context.watch<DashboardController>().calenderFilter==1?Colors.green:secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text('Week')
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            onTap: (){
              context.read<DashboardController>().setCalenderFilter(2);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                padding: EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                    color:  context.watch<DashboardController>().calenderFilter==2?Colors.green:secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text('Month')
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            onTap: (){
              context.read<DashboardController>().setCalenderFilter(3);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                padding: EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                    color:  context.watch<DashboardController>().calenderFilter==3?Colors.green:secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text('Year')
            ),
          ),
        ],
      ),
    );
  }
}
