import 'package:flutter/material.dart';
import 'package:fluxstore/utils/constants.dart';
import 'package:fluxstore/utils/models/feature_product_model.dart';
import 'package:fluxstore/utils/styles.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<FeatureProductModel> featureProduct = [
    FeatureProductModel(image: "assets/turtleneckSweaterModel_Image.png",price: 39.99,name: "Turtleneck Sweater"),
    FeatureProductModel(image: "assets/longSleeveDressModel_Image.png",price: 45.00,name: "Long Sleeve Dress"),
    FeatureProductModel(image: "assets/sportswearSetModel_Image.png",price: 80.00,name: "Sportswear Set"),
    FeatureProductModel(image: "assets/ElegantDressModel_Image.png",price: 70.00,name: "Elegant Dress"),
  ];

  List<FeatureProductModel> recommendedProduct = [
    FeatureProductModel(image: "assets/whiteFashionHoodie_Image.png",price: 30.00,name: "White fashion hoodie"),
    FeatureProductModel(image: "assets/cottonTshirt_Image.png",price: 29.00,name: "Cotton T-shirt"),
  ];

  List icons = [
    Icons.female_sharp,
    Icons.male_sharp,
    Icons.beach_access,
    Icons.child_friendly,
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultHeightPadding),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildGestureDetector(0),
                  buildGestureDetector(1),
                  buildGestureDetector(2),
                  buildGestureDetector(3),
                ],
              ),
            ),
            const SizedBox(height: defaultHeightPadding),
            Stack(
                children: [
                  Image.asset("assets/autumnCollection2022_Image.png"),
                  const Align(
                    alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Autumn\nCollection\n2024", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      ))
                ]
                ),
            const SizedBox(height: defaultHeightPadding),
            const Text("Feature Products", style: subheadingTextStyle,),
            const SizedBox(height: defaultHeightPadding),
            SizedBox(
              height: 235,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: featureProduct.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey[350]
                            ),
                            width: 126,
                            height: 172,
                            child: Center(child: Image.asset(featureProduct[index].image, fit: BoxFit.fill,)),
                          ),
                          const SizedBox(height: 10),
                          Text(featureProduct[index].name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, overflow: TextOverflow.ellipsis),),
                          Text("\$ ${featureProduct[index].price}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(height: defaultHeightPadding),
            Image.asset("assets/hangoutAndPartyCollection_Image.png"),
            const SizedBox(height: defaultHeightPadding),
            const Text("Recommended", style: subheadingTextStyle,),
            const SizedBox(height: defaultHeightPadding),
            SizedBox(
              height: 66,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedProduct.length,
                  itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  width: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(recommendedProduct[index].image),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recommendedProduct[index].name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, overflow: TextOverflow.ellipsis),),
                          Text("\$ ${recommendedProduct[index].price}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: defaultHeightPadding),
            const Text("Top Collection", style: subheadingTextStyle,),
            const SizedBox(height: defaultHeightPadding),
            Container(
              height: 210,
              width: double.infinity,
              color: const Color(0xFFF8F8FA),
              child: Stack(
                children: [
                  const Positioned(
                    left: 23,
                    top: 34,
                    child: Text("| Summer Collection 2024", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),),
                  ),
                  const Positioned(
                      left: 24,
                      top: 74,
                      child: Text("Most Sexy\n& fabulous\ndesign", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                  Positioned(
                    left: 160,
                      child: Image.asset("assets/summerCollection2021Model_Image.png"))
                ],
              ),
            ),
            const SizedBox(height: defaultHeightPadding),
            SizedBox(
              height: 180,
              child: Row(
                children: [
                  Image.asset("assets/theOfficeLife_Image.png"),
                  const SizedBox(width: 10),
                  Image.asset("assets/DressesElegantDressModel_Image.png")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(int currentIndex) {
    return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = currentIndex;
                  });
                },
                child: CircleAvatar(
                  radius: currentIndex == selectedIndex ? 28 : 24,
                  backgroundColor: currentIndex == selectedIndex ? Colors.brown : Colors.grey[200],
                  child: Icon(icons[currentIndex], color: currentIndex == selectedIndex ? Colors.white : Colors.black,),
                ),
              );
  }

  Widget buildSelectableCircle({required IconData icon, int currentIndex =1}) {
    return CircleAvatar(
      radius: currentIndex == 1 ? 24 : 34,
      backgroundColor: Colors.grey[200],
      child: Icon(icon, color: Colors.black,),
    );
  }
}
