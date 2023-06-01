

import 'package:dev_x_hub/apps/domain/repository/products_repo.dart';
import 'package:dev_x_hub/general/client/base_client.dart';
import 'package:dev_x_hub/general/constants/urls.dart';

import '../../../../domain/model/product.dart';
import 'package:dio/dio.dart' as dio;

class ProductRepoImpl extends ProductRepo{

 

  @override
  Future<List<Product>> getAllProduct()  async{

      try {

        dio.Response response = await BaseClient.get(url: Urls.allProductsUrl);

        if(response.statusCode == 200){

          print(response.data);

          List<Product> allProducts = [];

          List products = response.data;

          for(var product in products ){
            allProducts.add(Product.fromJson(product));
          }

          return allProducts;
          
          

        }else{
          print(response.statusCode);
          throw "Error";
        }
        
      } catch (e) {

        Exception(e.toString());
        rethrow;
        
      }

  }

  

}