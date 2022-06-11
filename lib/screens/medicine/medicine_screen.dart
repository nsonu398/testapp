import 'package:testapp/controllers/DashboardController.dart';
import 'package:testapp/controllers/MedicineController.dart';
import 'package:testapp/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/screens/medicine/components/EditMedicineField.dart';

import '../../constants.dart';
import '../dashboard/components/header.dart';
import 'components/MedicineSuggestionListItem.dart';
import 'components/add_medicine_field.dart';

class MedicineScreen extends StatelessWidget {
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
                              fieldProperty: context.watch<MedicineController>().getFieldProperty(index),
                              fieldValue: context.watch<MedicineController>().getFieldValue(index),
                              showFieldSuggestions: context.watch<MedicineController>().getShowFieldSuggestuions(index),
                              callback: (value){
                                context.read<MedicineController>().addFieldDetails(index, value);
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
                            var x = [value as String,'','f'];
                            context.read<MedicineController>().addNewField(x);
                          },
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            child: ElevatedButton(onPressed: (){
                              context.read<MedicineController>().setShowNewFieldWidget(true);
                            }, child: Text('Add Field') ,style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),),
                          ),
                          Container(
                            width: 150,
                            child: ElevatedButton(onPressed: (){
                              context.read<MedicineController>().setShowNewFieldWidget(false);
                            }, child: Text('Save')),
                          )
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
                  SizedBox(width: defaultPadding*2),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 4,
                    child: //StarageDetails(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Suggestions',style: Theme.of(context).textTheme.headline6,),
                          SizedBox(height: defaultPadding,),
                          ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index){
                              return MedicineSuggestionListItem();
                            }
                          )
                        ],
                      ),
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

