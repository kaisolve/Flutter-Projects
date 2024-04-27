import 'package:dio/dio.dart';
import 'package:kreis/core/app_url/app_url.dart';
import 'package:kreis/core/utils/preferences.dart';
import 'package:kreis/data/datasources/remote/dio/dio_client.dart';
import 'package:kreis/data/models/order_model.dart';

class OrderRepository {
  Future<void> storeOrder(OrdersModel ordersModel) async {
    try {
      FormData formData = FormData.fromMap(ordersModel.toJson());
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken!;
      }
      Response response =
          await dioClient.post(AppUrls.orders, formData: formData);
      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to Store Orders');
      }
    } catch (error) {
      throw Exception('Failed to Store Orders: $error');
    }
  }

  Future<List<OrderDetailsModel>> getOrder(String type) async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken!;
      }
      Response response = await dioClient.get('${AppUrls.orders}?type=$type');
      if (response.statusCode == 200) {
        List<dynamic> orders =
            response.data['data']; // list of each send order click
        final List<OrderDetailsModel> orderItems = List.generate(
            orders.length,
            (index) =>
                OrderDetailsModel.fromJson(orders[index])); // list of orders
        return orderItems;
      } else {
        throw Exception('Failed to Get Orders');
      }
    } catch (error) {
      throw Exception('Failed to Get Orders: $error');
    }
  }

  Future<OrderDetailsModel> getOneOrder(String id) async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken!;
      }
      Response response = await dioClient.get('${AppUrls.orders}/$id');
      if (response.statusCode == 200) {
        OrderDetailsModel orders =
            OrderDetailsModel.fromJson(response.data['data']);
        return orders;
      } else {
        throw Exception('Failed to Get Orders');
      }
    } catch (error) {
      throw Exception('Failed to Get Orders: $error');
    }
  }

  Future<void> cancelOrder(int id) async {
    try {
      DioClient dioClient = DioClient(baseUrl: AppUrls.baseUrl);
      if (Preferences().getUserData().success) {
        dioClient.dio.options.headers['Authorization'] =
            Preferences().getUserData().userToken!;
      }
      Response response = await dioClient.delete('${AppUrls.orders}/$id');
      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to Delete Order');
      }
    } catch (error) {
      throw Exception('Failed to Delete Order: $error');
    }
  }
}
