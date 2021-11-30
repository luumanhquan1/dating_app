
class DataChanel<Error, Data> {
  Error? error;
  Data? data;

  bool get hasError => error != null;
  bool get hasData => data != null;

  DataChanel({
    required this.error,
    required this.data,
  });

  factory DataChanel.error(Error? error) {
    return DataChanel(error: error, data: null);
  }

  factory DataChanel.data(Data data) {
    return DataChanel(
      error: null,
      data: data,
    );
  }

  factory DataChanel.forward(DataChanel _dc, Data data) {
    if (_dc.hasError) {
      return DataChanel.error(_dc.error as Error);
    }

    return DataChanel.data(data);
  }

  void pick({
    Function(Error? error)? onError,
    Function(Data? data)? onNoError,
    Function(Data? data)? onData,
    Function()? onNoData,
  }) {
    if (hasError) {
      if (onError != null) {
        onError(error);
      }
      return;
    }
    if (onNoError != null) {
      onNoError(data);
      return;
    }
    if (hasData) {
      if (onData != null) {
        onData(data);
      }
      return;
    }
    if (onNoData != null) {
      onNoData();
      return;
    }
  }
}