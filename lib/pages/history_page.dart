
import 'package:web_source/utils/tools/file_importants.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> _itemsHotelimage = [
    "assets/hotel1.png",
    "assets/hotel2.png",
    "assets/hotel1.png",
  ];
  List<String> _itemsHoteltitle = [
    "Ambrosia Hotel & Restaurant",
    "Tava Restaurant",
    "Haatkhola"
  ];
  List<String> _itemsHotelCheck = ["Check", "Check", "Check"];
  List<String> _itemsHotellocation = [
    "kazi Deiry, Taiger Pass\nChittagong",
    "Zakir Hossain Rd,\nChittagong",
    "6 Surson Road,\nChittagong"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 90,
                child: Center(
                  child: Text(
                    "Booking History",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xff32B768),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  _itemsHoteltitle.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: HotelCard(
                        titleButton: _itemsHotelCheck[index],
                        title: _itemsHoteltitle[index],
                        location: _itemsHotellocation[index],
                        image: _itemsHotelimage[index],
                        c1w: MediaQuery.of(context).size.width * 0.94,
                        c1h: 88,
                        c2w: double.infinity,
                        c2h: 64),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
