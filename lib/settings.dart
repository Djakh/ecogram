enum Environment { Development, Production }

Map<String, String>? config;

Map<String, String> devConstants = {
  "base_url": "http://159.65.221.248:8089/api",
};

Map<String, String> prodConstants = {
  "base_url": "http://159.65.221.248:8089/api",
};

bool get isInDebugMode {
  // Assume you're in production mode.
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDebugMode = true);

  return inDebugMode;
}

void setEnvironment(Environment env) {
  Settings.env = env;
  switch (env) {
    case Environment.Production:
      config = prodConstants;
      break;
    default:
      config = devConstants;
      break;
  }
}

class Settings {
  static Environment? env;
  static String get baseUrl => config!["base_url"]!;
}
