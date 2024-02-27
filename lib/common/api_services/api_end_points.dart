class ApiEndPoints {
  // Base URL for the API
  static const String baseUrl = "http://3.6.93.63:8000/";

  // Endpoint for user login
  static const String loginEndPoint = "${baseUrl}auth/login";

  // Endpoint for fetching visits
  static const String visitEndPoint = "${baseUrl}visits";

  // Endpoint for fetching conditions
  static const String conditionEndPoint = "${baseUrl}categories/condition";

  // Endpoint for updating visit tasks
  static const String updateVisitEndPoint = "${baseUrl}visits/task/complete";
}
