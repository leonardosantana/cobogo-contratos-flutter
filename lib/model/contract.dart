
class Contract{

  final String name;
  final String details;
  final double progress;
  final double cust;
  final double profit;
  final String address;
  final String image;
  final String picture;

  const Contract({this.name, this.details, this.progress, this.cust, this.profit, this.address, this.image, this.picture});

}

List<Contract> contracts = [
  const Contract(
    name: "Casa 07",
    details: "Milkyway Galaxy",
    progress: 50.0,
    cust: 200000,
    profit: 60000,
    address: "QE 52 conj M casa 7",
    image: "assets/images/mars.png",
    picture: "https://images.freeimages.com/images/large-previews/f3e/building-1522324.jpg"
  ),
  const Contract(
    name: "ParkWay 15",
    details: "Milkyway Galaxy",
    progress: 50.0,
    cust: 200000,
    profit: 60000,
    address: "QE 52 conj M casa 7",
    image: "assets/images/mars.png",
    picture: "https://images.freeimages.com/images/large-previews/271/office-buildings-in-paris-1228744.jpg"

  ),
  const Contract(
    name: "Casa Amarela",
    details: "Milkyway Galaxy",
    progress: 50.0,
    cust: 200000,
    profit: 60000,
    address: "QE 52 conj M casa 7",
    image: "assets/images/mars.png",
    picture: "https://images.freeimages.com/images/large-previews/0bf/office-buildings-downtown-1214255.jpg"
  ),
  const Contract(
    name: "Mars",
    details: "Milkyway Galaxy",
    progress: 50.0,
    cust: 200000,
    profit: 60000,
    address: "QE 52 conj M casa 7",
    image: "assets/images/mars.png",
    picture: "https://images.freeimages.com/images/large-previews/041/building-1-1234567.jpg"
  )
];