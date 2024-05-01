class AppUrls {
  static const String baseUrl = 'https://ecommerce.project-nami.xyz/api/';

  //endPoints
  static const String register = 'user/auth/register';
  static const String login = 'user/auth/login';
  static const String logout = 'user/profile/logout';
  static const String deleteAccount = 'user/profile/deleteAccount';
  static const String updateProfile = 'user/profile/updateProfile';
  static const String categories = 'user/home/categories';
  static const String subCategories = 'user/home/sub-categories/';
  static const String slider = 'user/home/slider';
  static const String latestProducts = 'user/home/latestProducts';
  static const String products = 'user/home/products';
  static const String addRemfavorites = 'user/home/add-remove-favorites';
  static const String myFavorites = 'user/profile/myFavorites';
  static const String contactUs = 'user/contact-us';
  static const String pointsHistory = 'user/profile/pointsHistory';
  static const String orders = 'user/orders';
  static const String about = 'setting';
  static String productsDetails(num categoryId, num subcategoryId) {
    return 'user/home/products?category_id=$categoryId&sub_category_id=$subcategoryId';
  }

  static const String cities = 'cities';
}
