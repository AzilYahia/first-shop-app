import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_appp/core/services/home_service.dart';
import 'package:shop_appp/model/category_model.dart';
import 'package:shop_appp/model/product_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection('Categories');

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
          CategoryModel.fromJson(
            value[i].data() as Map<String, dynamic>,
          ),
        );
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
          CategoryModel.fromJson(
            value[i].data() as Map<String, dynamic>,
          ),
        );
        _loading.value = false;
      }
      print(productModel.length);
      update();
    });
  }
}
