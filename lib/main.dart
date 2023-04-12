import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Product(),
    ),
  );
}

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  double sliderval = 0;

  List<Map> Products = [
    {
      'id': 1,
      'per': "Phone",
      'pi': "rs.12500",
      'les': "Wearables",
    },
    {
      'id': 2,
      'per': "Computer",
      'pi': "rs.30500",
      'les': "Electrics and Electronics",
    },
    {
      'id': 3,
      'per': "Watch",
      'pi': "rs.2500",
      'les': "Wearables",
    },
    {
      'id': 4,
      'per': "T-shirt",
      'pi': "rs.1500",
      'les': "Wearables",
    },
    {
      'id': 5,
      'per': "Jeens",
      'pi': "rs.1540",
      'les': "Wearables",
    },
    {
      'id': 6,
      'per': "Refrigerator",
      'pi': "rs.30000",
      'les': "Electrics and Electronics",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Product"),
        centerTitle: true,
        actions: [
          Icon(Icons.apps_rounded),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Slider(
            min: 0,
            max: 6,
            label: "",
            divisions: 6,
            value: sliderval,
            onChanged: (val) {
              setState(() {
                sliderval = val;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "All Products < Rs.30040",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ...Products.map((e) {
            if ((e['id'] <= sliderval)) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade700,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "  ${e['id']} ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${e['per']}\n",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "${e['pi']}",
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              " ${e['pi']}",
                              style: TextStyle(color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          }).toList(),
        ],
      ),
    );
  }
}
