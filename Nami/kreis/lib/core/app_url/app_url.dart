class AppUrls {
  static late int categoryId = 0;
  static late int subcategoryId = 0;
  static const String baseUrl = 'https://ecommerce.project-nami.xyz/api/';

  //endPoints
  static const String categories = 'user/home/categories';
  static const String subCategories = 'user/home/sub-categories/';
  static const String slider = 'user/home/slider';
  static const String latestProducts = 'user/home/latestProducts';
  static const String products = 'user/home/products';
  static String productsDetails =
      'user/home/products?category_id=$categoryId&sub_category_id=$subcategoryId';
  static const String cities = 'cities';
}
