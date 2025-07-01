class ApiEndpoints {
  static String baseUrl = 'https://eocietndxuzfadydowog.supabase.co/rest/v1/';
  static String getAllProducts =
      'products_table?select=*,favorite_table(*),purchase_table(*)';

  static String getCategoryProducts =
      'products_table?select=*,favorite_table(*),purchase_table(*)';

  static String getRates = 'rates_table?select=*';

  static String postRate = 'rates_table?select=*';
}

// class ApiKeys {
//   static String status = 'statusCode';
//   static String errMessage = 'ErrorMessage';
//   static String email = 'email';
//   static String name = 'name';
//   static String phone = 'phone';
//   static String password = 'password';
//   static String confirmPassword = 'confirmPassword';
//   static String location = 'location';
//   static String profilePic = 'avatar';
//   static String token = 'access_token';
//   static String refreshToken = 'refresh_token';
//   static String id = 'id';
//   static String message = 'message';
// }
