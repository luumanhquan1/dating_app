class EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final bool debugApiClient;
  final String apiBaseUrl;
  final String apiToken;
  final String apiUrlSocket;

  EnvData({
    required this.debug,
    required this.debugShowCheckedModeBanner,
    required this.debugShowMaterialGrid,
    required this.debugApiClient,
    required this.apiBaseUrl,
    required this.apiToken,
    required this.apiUrlSocket
  });
}