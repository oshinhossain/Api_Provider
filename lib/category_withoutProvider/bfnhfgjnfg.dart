import '../category_provider/model_category.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;

class ApiDataService{
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


}