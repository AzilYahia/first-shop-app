import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_appp/core/view/cart_view.dart';
import 'package:shop_appp/core/view/palette.dart';
import 'package:shop_appp/model/product_model.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;

  DetailsView(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height,
                    height: 250,
                    child: Image.network(
                      model.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      color: Colors.black26,
                      onPressed: () => Get.to(CartView()),
                      icon: SvgPicture.asset('images/svg/cart.svg'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          model.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 27,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    model.size,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Color',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 20,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      // color: model.color,
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Details',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          model.description,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          model.price + ' \DZD',
                          style: TextStyle(
                            color: kBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    // GetBuilder<CartViewModel>(
                    // init: Get.put(CartViewModel()),
                    // builder: (controller) => ValidationButton(
                    //   'Add',
                    //       () => controller.addProduct(
                    // CartProductModel(
                    //   name: _model.name,
                    //   image: _model.image,
                    //   price: _model.price,
                    //   productId: _model.productId,
                    // ),
                    // ),
                    // ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
