class CurrencyInfo {
  final String flagUrl;
  final String currencyCode;
  final String currencyName;
  final double buyValue;
  final double sellValue;
  final bool isBuyTrendingUp;
  final bool isSellTrendingUp;

  CurrencyInfo({
    required this.flagUrl,
    required this.currencyCode,
    required this.currencyName,
    required this.buyValue,
    required this.sellValue,
    required this.isBuyTrendingUp,
    required this.isSellTrendingUp,
  });

  static final List<CurrencyInfo> currencies = [
    CurrencyInfo(
      flagUrl: "https://img.freepik.com/vetores-gratis/ilustracao-de-bandeira-brasil_53876-27017.jpg?semt=ais_items_boosted&w=740",
      currencyCode: "BRL",
      currencyName: "Brazilian Real",
      buyValue: 5.271,
      sellValue: 5.198,
      isBuyTrendingUp: false,
      isSellTrendingUp: true,
    ),
    CurrencyInfo(
      flagUrl: "https://www.gov.br/agricultura/pt-br/assuntos/relacoes-internacionais/agro-mais-investimentos/imagens/bandeira-dos-estados-unidos.png/@@images/image.png",
      currencyCode: "USD",
      currencyName: "United States Dollar",
      buyValue: 1.000,
      sellValue: 0.998,
      isBuyTrendingUp: true,
      isSellTrendingUp: false,
    ),
    CurrencyInfo(
      flagUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/1920px-Flag_of_Canada_%28Pantone%29.svg.png",
      currencyCode: "CAD",
      currencyName: "Canadian Dollar",
      buyValue: 1.3467,
      sellValue: 1.3421,
      isBuyTrendingUp: true,
      isSellTrendingUp: false,
    ),
    CurrencyInfo(
      flagUrl: "https://img.freepik.com/vetores-gratis/ilustracao-de-bandeira-brasil_53876-27017.jpg?semt=ais_items_boosted&w=740",
      currencyCode: "BRL",
      currencyName: "Brazilian Real",
      buyValue: 5.271,
      sellValue: 5.198,
      isBuyTrendingUp: false,
      isSellTrendingUp: true,
    ),
    CurrencyInfo(
      flagUrl: "https://www.gov.br/agricultura/pt-br/assuntos/relacoes-internacionais/agro-mais-investimentos/imagens/bandeira-dos-estados-unidos.png/@@images/image.png",
      currencyCode: "USD",
      currencyName: "United States Dollar",
      buyValue: 1.000,
      sellValue: 0.998,
      isBuyTrendingUp: true,
      isSellTrendingUp: false,
    ),
    CurrencyInfo(
      flagUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/1920px-Flag_of_Canada_%28Pantone%29.svg.png",
      currencyCode: "CAD",
      currencyName: "Canadian Dollar",
      buyValue: 1.3467,
      sellValue: 1.3421,
      isBuyTrendingUp: true,
      isSellTrendingUp: false,
    ),
  ];
}