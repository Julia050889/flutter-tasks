class RegularExpressions {
  static String email =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static String password = r"^(?=.*[a-z]).{8,32}$";
  static String username = r"^[a-zA-Z0-9\._!\-@]+$";
}
