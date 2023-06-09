import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_crud_with_getx/app/modules/products/controllers/products_controller.dart';

import '../../../core/service/api_service.dart';
import '../../../routes/app_pages.dart';

class AddProductController extends GetxController {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController mrpPriceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  onSaveProduct() async {
    Map<String, dynamic> body = {
      "name": productNameController.text,
      "barcode": "string",
      "description": descriptionController.text,
      "image": "string",
      "subCategory": 1851,
      "brand": 1901,
      "quantity": {
        "quantity": 0,
        "unit": "string",
        "unitValue": 0,
        "pastQuantity": 0
      },
      "productPrice": {
        "price": productPriceController.text,
        "unitPrice": unitPriceController.text,
        "mrp": mrpPriceController.text
      }
    };
    isLoading.value = true;
    await ApiServiceHandler.post(
        "https://secure-falls-43052.herokuapp.com/api/create-products", body,
        onSuccess: (response) async {
      isLoading.value = false;
      await Get.find<ProductsController>().getProductList();
      Get.offAndToNamed(Routes.PRODUCTS);
    }, onError: (error) {
      isLoading.value = false;
      log("-->$error");
      Get.snackbar("Error!", "Something wrong, please try again.");
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
