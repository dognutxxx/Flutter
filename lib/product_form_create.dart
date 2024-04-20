import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductFormCreate extends StatefulWidget {
  const ProductFormCreate({super.key});

  @override
  State<ProductFormCreate> createState() => _ProductFormCreateState();
}

class _ProductFormCreateState extends State<ProductFormCreate> {
  final dio = Dio();
  final baseApi = "https://testpos.trainingzenter.com/lab_dpu/product/create/";
  final productName = TextEditingController();
  final productCover = TextEditingController();
  final productDescription = TextEditingController();
  final productPrice = TextEditingController();

  late String productOwner = "65230035";
  late String msg = "";
  @override
  Future<dynamic> productCreate() async {
    if (productName.text == '' ||
        productCover.text == '' ||
        productDescription.text == '' ||
        productPrice.text == '') {
      setState(() {
        msg = "กรุณาระบุข้อมูลให้ครบถ้วน";
      });
      return false;
    }
    try {
      await dio
          .post(baseApi,
              data: {
                "product_name": productName.text,
                "product_cover": productCover.text,
                "product_price": productPrice.text,
                "product_description": productDescription.text,
                "product_owner": productOwner
              },
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              }))
          .then((response) => {Navigator.pushNamed(context, "product")});
    } catch (e) {
      setState(() {
        msg = "เกิดข้อผิดพลาด ไม่สามารถทำรายการได้";
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('เพิ่มสินค้า'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: productName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'ชื่อสินค้า'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: productCover,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'URL รูปสินค้า'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: productDescription,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'รายละเอียดสินค้า'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: productPrice,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'ราคา'),
            ),
          ),
          TextButton(
              onPressed: productCreate,
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("บันทึกข้อมูล",
                  style: TextStyle(color: Colors.blue))),
        ],
      ),
    );
  }
}
