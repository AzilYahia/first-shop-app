import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_appp/core/view/palette.dart';
import 'package:shop_appp/core/view/widgets/FieldText.dart';
import 'package:shop_appp/core/view/widgets/SubmitButton.dart';
import 'package:shop_appp/core/viewmodel/cart_view_model.dart';
import 'package:shop_appp/core/viewmodel/checkout_view_model.dart';

class CheckoutView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 24.h,
                left: 16.w,
                right: 16.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  Container(
                    width: 24.w,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16.w,
                  left: 16.w,
                  bottom: 24.h,
                ),
                child: Form(
                  key: _formKey,
                  child: GetBuilder<CheckoutViewModel>(
                    init: Get.put(CheckoutViewModel()),
                    builder: (controller) => Column(
                      children: [
                        ListViewProducts(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Fieldtext(
                          hint: 'Street',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid street name.';
                          },
                          onSave: (value) {
                            controller.street = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Fieldtext(
                          hint: 'City',
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid city name.';
                          },
                          onSave: (value) {
                            controller.city = value;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Fieldtext(
                                hint: 'State',
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4)
                                    return 'Please enter valid state name.';
                                },
                                onSave: (value) {
                                  controller.state = value;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 36.w,
                            ),
                            Expanded(
                              child: Fieldtext(
                                hint: 'Country',
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4)
                                    return 'Please enter valid city name.';
                                },
                                onSave: (value) {
                                  controller.country = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Fieldtext(
                          hint: '+213123456789',
                          keyboardtype: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 10)
                              return 'Please enter valid number.';
                          },
                          onSave: (value) {
                            controller.phone = value;
                          },
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        SubmitButton(
                          texty: 'SUBMIT',
                          onPress: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await controller.addCheckoutToFireStore();
                              Get.dialog(
                                AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: kBlue,
                                          size: 200.h,
                                        ),
                                        Text(
                                          'Order Submitted',
                                          style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold,
                                            color: kBlue,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        SubmitButton(
                                          texty: 'Done',
                                          onPress: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                barrierDismissible: false,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Column(
        children: [
          Container(
            height: 160.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.cartProductModel.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.white,
                        ),
                        height: 120.h,
                        width: 120.w,
                        child: Image.network(
                          controller.cartProductModel[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        controller.cartProductModel[index].name,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        '\DZD ${controller.cartProductModel[index].price} x ${controller.cartProductModel[index].quantity}',
                        style: TextStyle(
                          fontSize: 14,
                          color: kBlue,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 15.w,
                );
              },
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'TOTAL: ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                '\DZD ${controller.totalPrice.toString()}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
