import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    CategoryProvider categoryProvider=Provider.of<CategoryProvider>(context,listen: false);
    categoryProvider.getCategoryProvider();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider=Provider.of<CategoryProvider>(context,);
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        Scaffold(
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
             onPressed: () {

             },

            ),
            title:Text("All Category",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
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
              SizedBox(height: 20,),
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
                      itemCount: categoryProvider.categoryList!.length,
                      itemBuilder: (context,index){
                        return  Column(
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height * .14,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: categoryProvider.categoryList![index].categoryImage != null
                                        ? NetworkImage(
                                      "https://bppshops.com/${categoryProvider.categoryList![index].categoryImage}",
                                    ) : NetworkImage(
                                      'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            SizedBox(
                              width: 90,
                              child: Text(
                                "${categoryProvider.categoryList![index].categoryName}", //categoryList.categoryName.toString(),
                                style: TextStyle(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );  }

                  ),
                ),
              ),
            ],
         ),),

        );
  }
}

