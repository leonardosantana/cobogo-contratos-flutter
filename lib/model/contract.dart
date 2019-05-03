
class Contract{

  String name;
  String details;
  double progress;
  double cust;
  double profit;
  String address;
  String image;
  String picture;

  Contract();

  Contract.fromData(this.name, this.details, this.progress, this.cust, this.profit,
      this.address, this.image, this.picture);

}

List<Contract> contracts = [
  Contract.fromData(
      "Casa 07",
      "Casa com 200m de contrução na qe 52 conjunto m do casa. A casa possui 3 quartos 2 banheiros sala cozinha, Possuie também 2 paivmentos e o primeiro andar sera todo aberto para melhor circulação e visualização ",
      50.0,
      200000,
      60000,
      "QE 52 conj M casa 7",
      "assets/images/houseBuild.png",
      "https://images.freeimages.com/images/large-previews/f3e/building-1522324.jpg"
  ),

  Contract.fromData(
     "ParkWay 15",
     "Milkyway Galaxy",
     50.0,
     200000,
     60000,
     "QE 52 conj M casa 7",
     "assets/images/houseBuild.png",
     "https://images.freeimages.com/images/large-previews/271/office-buildings-in-paris-1228744.jpg"
  ),
  Contract.fromData(
     "Casa Amarela",
    "Milkyway Galaxy",
     50.0,
     200000,
     60000,
     "QE 52 conj M casa 7",
     "assets/images/houseBuild.png",
    "https://images.freeimages.com/images/large-previews/0bf/office-buildings-downtown-1214255.jpg"
  ),
  Contract.fromData(
     "Mars",
     "Milkyway Galaxy",
     50.0,
     200000,
     60000,
     "QE 52 conj M casa 7",
     "assets/images/houseBuild.png",
     "https://images.freeimages.com/images/large-previews/041/building-1-1234567.jpg"
  )
];