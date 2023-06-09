import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_crud_with_getx/app/core/common_widgets/common_button.dart';

import '../../../core/common_widgets/common_text_field.dart';
import '../../../core/resource/colors.dart';
import '../../../core/utils/validator.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var productNameWidget = CommonTextField(
      validator: Validator().nullFieldValidate,
      hintText: "Product Name",
      labelText: "Product Name",
      controller: controller.productNameController,
    );
    var descriptionWidget = CommonTextField(
      validator: Validator().nullFieldValidate,
      hintText: "Description",
      labelText: "Description",
      controller: controller.descriptionController,
    );
    var priceWidget = CommonTextField(
      validator: Validator().nullFieldValidate,
      hintText: "Product Price",
      labelText: "Product Price",
      keyboardType: TextInputType.number,
      controller: controller.productPriceController,
    );
    var unitPriceWidget = CommonTextField(
      validator: Validator().nullFieldValidate,
      hintText: "Unit Price",
      labelText: "Unit Price",
      keyboardType: TextInputType.number,
      controller: controller.unitPriceController,
    );
    var mrpPriceWidget = CommonTextField(
      validator: Validator().nullFieldValidate,
      hintText: "MRP Price",
      labelText: "MRP Price",
      keyboardType: TextInputType.number,
      controller: controller.mrpPriceController,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                productNameWidget,
                const SizedBox(
                  height: 10,
                ),
                descriptionWidget,
                const SizedBox(
                  height: 10,
                ),
                priceWidget,
                const SizedBox(
                  height: 10,
                ),
                unitPriceWidget,
                const SizedBox(
                  height: 10,
                ),
                mrpPriceWidget,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() => controller.isLoading.value
            ? const SizedBox(
                height: 60, child: Center(child: CircularProgressIndicator()))
            : CommonButton(
                onTap: () async {
                  if (controller.formKey.currentState!.validate()) {
                    await controller.onSaveProduct();
                  }
                },
                buttonTitle: "ADD PRODUCT")),
      ),
    );
  }
}
