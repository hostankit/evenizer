class FirestorePath {
  static String hostel(String uid, String hostelId) => 'hostels/$hostelId';
  static String hostels() => 'hostels';
  static String search(String uid, String searchId) =>
      'users/$uid/searches/$searchId';
  static String searches(String uid) => 'users/$uid/searches';
}