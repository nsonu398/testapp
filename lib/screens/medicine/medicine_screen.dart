import 'package:testapp/controllers/DashboardController.dart';
import 'package:testapp/controllers/MedicineController.dart';
import 'package:testapp/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/screens/dashboard/components/my_fields.dart';
import 'package:testapp/screens/medicine/components/EditMedicineField.dart';

import '../../constants.dart';
import '../dashboard/components/header.dart';
import '../dashboard/components/recent_files.dart';
import '../dashboard/components/storage_details.dart';
import 'components/add_medicine_field.dart';

class MedicineScreen extends StatelessWidget {

  MedicineScreen(){

  }
  var array = [['Name',''],['Company',''],['Type',''],['Amount(in mg or ml)',''],['Price per pack','']];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: 'Medicine'),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Loader(),
                      //MyFiles(),
                      //SizedBox(height: defaultPadding),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:(context.watch<MedicineController>().array as List<Object>).length,
                        itemBuilder: (context,index){
                          return  AddMedicineField(
                              property: context.watch<MedicineController>().getProperty(index),
                              callback: (value){
                                array[index][1]=value as String;
                              }
                          );
                        }
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Visibility(
                        visible: context.watch<MedicineController>().showNewFieldWidget,
                        child: EditMedicineField(
                          property: 'New Filed',
                          callback: (value){
                            var x = [value as String,''];
                            context.read<MedicineController>().addNewField(x);
                          },
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(onPressed: (){
                            context.read<MedicineController>().setShowNewFieldWidget(true);
                          }, child: Text('Add Field') ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),),
                          ElevatedButton(onPressed: (){
                            context.read<MedicineController>().setShowNewFieldWidget(false);
                          }, child: Text('Save'))
                        ],
                      )
                      /*RecentFiles(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StarageDetails(),*/
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 4,
                    child: StarageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Column(
        children: [
          Text('loading...'),
          SizedBox(height: defaultPadding,),
        ],
      ),
      visible: context.watch<DashboardController>().isLoading,
    );
  }
}

