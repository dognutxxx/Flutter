import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myaboutme/product_form_create.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final dio = Dio();
  final baseApi =
      "https://testpos.trainingzenter.com/lab_dpu/product/list/65230035?format=json";
  late List productList = [];
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    try {
      await dio
          .get(baseApi,
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ))
          .then((response) => {
                if (response.statusCode == 200)
                  {
                    setState(() {
                      productList = response.data!;
                    })
                  }
              });
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  Widget build(BuildContext context) {
    print(productList);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('สินค้าของฉัน'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductFormCreate()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 210, 19),
                  ),
                  child: const Text(
                    'เพิ่มข้อมูล',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
                child: TextButton(
              onPressed: () {},
              child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image.network(productList[index]["product_cover"]),
                          ListTile(
                            leading: const Icon(Icons.arrow_drop_down_circle),
                            title: Text(productList[index]["product_name"]),
                            subtitle: Text(
                                'ราคา ${productList[index]["product_price"]} บาท'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'วันที่ลงสินค้า ${productList[index]["update_date"]}'),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductDetail(
                                                  productName: productList[
                                                              index]
                                                          ["product_name"] ??
                                                      '',
                                                  productCover: productList[
                                                              index]
                                                          ["product_cover"] ??
                                                      '',
                                                  productDescription: productList[
                                                              index][
                                                          "product_description"] ??
                                                      '',
                                                  productPrice: productList[
                                                              index]
                                                          ["product_price"] ??
                                                      '',
                                                )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(
                                          24, 177, 252, 1)),
                                  child: const Text(
                                    'รายละเอียด..',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ))
          ],
        ));
  }
}

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    required this.productName,
    required this.productCover,
    required this.productDescription,
    required this.productPrice,
  }) : super(key: key);

  final String productName;
  final String productCover;
  final String productDescription;
  final String productPrice;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(widget.productCover),
                ListTile(
                  title: Text(widget.productName),
                  subtitle: Text(widget.productDescription),
                ),
                Text(
                  'ราคา ${widget.productPrice}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
