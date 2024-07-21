import 'package:flutter/material.dart';
import 'package:fluxstore/utils/constants.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<bool> isExpanded = [false,false,false,false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(23),
                      child: TextField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search_sharp),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: IconButton(
                      icon : Icon(Icons.tune_sharp,color: Colors.grey[600]),
                      onPressed: (){
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  )

                ],
              ),
              const SizedBox(height: defaultHeightPadding,),
              ExpansionPanelList(
                materialGapSize: 0,
                dividerColor: Colors.transparent,
                expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 0),
                elevation: 0,
                expansionCallback: (index, isExpanded){
                  setState(() {
                    this.isExpanded[index] = isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                    isExpanded: isExpanded[0],
                    canTapOnHeader: true,
                      headerBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/clothingsDiscoverPage_Image.png"),
                        );
                  },
                      body: _buildExpandableTiles()),
                  ExpansionPanel(
                      isExpanded: isExpanded[1],
                      canTapOnHeader: true,
                      headerBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(top: 8,left: 8,bottom: 8,right: 0),
                          child: Image.asset("assets/accessoriesDiscoverPage_Image.png"),
                        );
                      },
                      body: _buildExpandableTiles(),),
                  ExpansionPanel(
                      isExpanded: isExpanded[2],
                      canTapOnHeader: true,
                      headerBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/shoesDiscoverPage_image.png"),
                        );
                      },
                      body: _buildExpandableTiles()),
                  ExpansionPanel(
                      isExpanded: isExpanded[3],
                      canTapOnHeader: true,
                      headerBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/collectionsDiscoverPage_image.png"),
                        );
                      },
                      body: _buildExpandableTiles())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildExpandableTiles(){
    return const SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(title: Text("Jacket"),),
          ExpansionTile(title: Text("Skirt")),
          ExpansionTile(title: Text("Dresses")),
        ],
      ),
    );
  }
}
