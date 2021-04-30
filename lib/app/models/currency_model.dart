class CurrencyModel {
  late final String name;
  late final double real;
  late final double dollar;
  late final double euro;
  late final double bitcoin;
  CurrencyModel(
      {required this.name,
      required this.real,
      required this.dollar,
      required this.euro,
      required this.bitcoin});

  String get getName {
    return this.name;
  }

  void set setName(String name) {
    this.name = name;
  }

  double get getReal {
    return this.real;
  }

  void set setReal(double real) {
    this.real = real;
  }

  double get getDollar {
    return this.dollar;
  }

  void set setDollar(double dollar) {
    this.dollar = dollar;
  }

  double get getEuro {
    return this.euro;
  }

  void set setEuro(double euro) {
    this.euro = euro;
  }

  double get getBitcoin {
    return this.bitcoin;
  }

  void set setBitcoin(double bitcoin) {
    this.bitcoin = bitcoin;
  }

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
          name: 'Real', real: 1.0, dollar: 0.18, euro: 0.15, bitcoin: 0.000016),
      CurrencyModel(
          name: 'Dollar',
          real: 5.63,
          dollar: 1.0,
          euro: 0.85,
          bitcoin: 0.000088),
      CurrencyModel(
          name: 'Euro', real: 6.62, dollar: 1.17, euro: 1.0, bitcoin: 0.00010),
      CurrencyModel(
          name: 'Bitcoin',
          real: 64116.51,
          dollar: 11351.30,
          euro: 9689.34,
          bitcoin: 1.0),
    ];
  }
}
