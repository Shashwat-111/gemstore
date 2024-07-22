import 'package:flutter/material.dart';
import 'package:fluxstore/utils/constants.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  List<Color?> colorList = [
    Colors.yellow[600],
    Colors.red,
    Colors.black,
    Colors.greenAccent,
    Colors.grey,
    Colors.brown,
    Colors.pinkAccent
  ];

  RangeValues _rangeValues = const RangeValues(20, 70);
  int? selectedRating;

  @override
  Widget build(BuildContext context) {
    return Theme(
      //this is required to show the label text in the RangeSlider used for price filter
      data: ThemeData (
        sliderTheme: const SliderThemeData(
          trackHeight: 2,
          showValueIndicator: ShowValueIndicator.always,
          rangeValueIndicatorShape: RectangularRangeSliderValueIndicatorShape()
        )
      ),

      child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Drawer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Filter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),), Icon(Icons.tune_sharp)
                      ],
                    ),
                    const Divider(),
                    const Text("Price", style: TextStyle(fontWeight: FontWeight.bold),),
                    RangeSlider(
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey[350],
                        values: _rangeValues,
                        min: 0,
                        max: 100,
                        labels: RangeLabels(_rangeValues.start.toInt().toString(), _rangeValues.end.toInt().toString()),
                        onChanged: (rangeValues){
                          setState(() {
                            _rangeValues = rangeValues;
                          });
                        },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Min: \$ ${_rangeValues.start.toInt().toString()}"),
                          Text("Max: \$ ${_rangeValues.end.toInt().toString()}")
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultHeightPadding),
                    const Text("Color", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: defaultHeightPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: colorList.map((color){
                        return CircleAvatar(backgroundColor: color,radius: 12,);
                      }).toList(),
                    ),
                    const SizedBox(height: defaultHeightPadding),
                    const Text("Star Rating", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: defaultHeightPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(5,(n) => n+1).map((rating){

                        //the circular rating selecting widget
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedRating = rating;
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedRating == rating ? Colors.black : null,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                )
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, size: 14, color: selectedRating == rating ? Colors.white : null,),
                                  Text(rating.toString(), style: TextStyle(color: selectedRating == rating ? Colors.white : null),),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList()
                    ),
                    const SizedBox(height: defaultHeightPadding),
                    const Text("Category", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: defaultHeightPadding),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                      ),
                      child: DropdownButton(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        value: "croptop",
                          items:const [
                            DropdownMenuItem(value: "croptop",child: Text("Crop Tops"),),
                            DropdownMenuItem(value: "shirts",child: Text("Shirts"),),
                            DropdownMenuItem(value: "Tshirt",child: Text("T shirts"),)
                          ],
                          onChanged: (v){
                          }),
                    )

                  ],
                ),
              ),
        ),
      )),
    );
  }
}
