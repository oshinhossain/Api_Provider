import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../category_provider/model_category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Future<CategotiesModel> getCategoriesService() async{
    Map<String,dynamic>? result;
    try{
      String url= 'https://bppshops.com/api/bs/category_view';
      http.Response response= await http.get(Uri.parse(url));
      print(response.body);
      if(response.statusCode==200){

        result=convert.jsonDecode(response.body);
        return CategotiesModel.fromJson(result!);
      }
    }catch(e){
      print(e.toString());
    }
    return CategotiesModel.fromJson(result!);
  }

  List<Getcategory>? categorilist = [];
  getdata() async {
    var data = await getCategoriesService();
    setState(() {
      categorilist = data.getcategory;
    });
  }
  @override
  void initState() {
    getdata();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextButton(
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: Text(
            "All Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.search, size: 30, color: Colors.grey),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 30,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: categorilist!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * .14,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image:
                                  NetworkImage(
                                    "https://bppshops.com/${categorilist![index].categoryImage}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          SizedBox(
                            width: 90,
                            child: Text(
                      categorilist![index].categoryName.toString(), //categoryList.categoryName.toString(),
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
