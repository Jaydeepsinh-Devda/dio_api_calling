class Profiles {
  static DevelopProfile developProfile = DevelopProfile();
  static ProductionProfile productionProfile = ProductionProfile();
}

class DevelopProfile {
  final String baseUrl = "https://reqres.in/api";
}

class ProductionProfile {
  final String basUrl = "https://jsonplaceholder.typicode.com";
}
