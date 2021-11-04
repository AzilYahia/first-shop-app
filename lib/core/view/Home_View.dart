import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_appp/core/view/details_view.dart';
import 'package:shop_appp/core/view/palette.dart';
import 'package:shop_appp/core/viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  final List<String> nameCategories = <String>[
    'snakers',
    'Hoodies',
    'suits',
    'hats'
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF2E9AEB),
                elevation: 0,
              ),
              backgroundColor: Color(0xFFEFEFEF),
              body: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 14,
                  right: 16,
                  left: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _searchTextFormField(),
                    //
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _listViewCategory(),
                    SizedBox(height: 30),
                    //Sneakers / nike /white     BIG filter
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sneakers / Nike / white',
                            style: TextStyle(
                                color: kBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: kBlue,
                            ),
                            padding: EdgeInsets.only(
                                top: 14, bottom: 14, left: 15, right: 15),
                            child: Text(
                              'Filter',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _listViewProducts(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 49,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.5,
              blurRadius: 7,
              offset: Offset(2, 3),
            ),
          ],
          color: Colors.white,
        ),
        padding: EdgeInsets.only(top: 5),
        child: TextFormField(
          onFieldSubmitted: (value) {
            //TODO
            // Get.to(SearchView(value));
          },
          decoration: InputDecoration(
            hintText: 'search...',
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: kBlue,
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 60,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding:
                  EdgeInsets.only(left: 10, right: 20, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.5,
                    blurRadius: 7,
                  ),
                ],
                border: Border.all(color: Colors.white),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kBlack,
                    ),
                    height: 20,
                    width: 50,
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Text(controller.categoryModel[index].name),
                    width: 70,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget _listViewProducts() {
  //   return GetBuilder<HomeViewModel>(
  //     builder: (controller) => Container(
  //       height: 320,
  //       child: ListView.separated(
  //         separatorBuilder: (BuildContext context, int index) => SizedBox(
  //           width: 15,
  //         ),
  //         itemCount: controller.productModel.length,
  //         scrollDirection: Axis.horizontal,
  //         itemBuilder: (BuildContext context, int index) {
  //           return GestureDetector(
  //             onTap: () {
  //               Get.to(DetailsView(
  //                 model: controller.productModel[index],
  //               ));
  //             },
  //             child: Container(
  //               width: 164,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(25),
  //                       color: Colors.white,
  //                     ),
  //                     height: 220,
  //                     width: 164,
  //                     child: Image.network(
  //                       controller.productModel[index].image,
  //                       fit: BoxFit.contain,
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                     child: Text(
  //                       controller.productModel[index].name,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                     child: Text(
  //                       controller.productModel[index].description,
  //                       style: TextStyle(
  //                         fontSize: 12,
  //                         color: Colors.grey,
  //                       ),
  //                       maxLines: 1,
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                     child: Text(
  //                       controller.productModel[index].price.toString() + ' \$',
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.w600,
  //                         color: kBlue,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 320,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 15,
          ),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => DetailsView(
                    controller.productModel[index],
                  ),
                );
              },
              child: Container(
                width: 164,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      height: 220,
                      width: 164,
                      child: Image.network(
                        controller.productModel[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      controller.productModel[index].name,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      controller.productModel[index].description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      'DZD${controller.productModel[index].price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kBlue,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
