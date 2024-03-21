class AppUrls {
  static const String baseUrl = 'https://ecommerce.project-nami.xyz/api/';

  //endPoints
  static const String register = 'user/auth/register';
  static const String login = 'user/auth/login';
  static const String categories = 'user/home/categories';
  static const String subCategories = 'user/home/sub-categories/';
  static const String slider = 'user/home/slider';
  static const String latestProducts = 'user/home/latestProducts';
  static const String products = 'user/home/products';
  static String productsDetails(int categoryId, int subcategoryId) {
    return 'user/home/products?category_id=$categoryId&sub_category_id=$subcategoryId';
  }

  static const String cities = 'cities';
}
