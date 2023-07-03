import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(GermanCitiesApp());
}

class CityInfo {
  final String cityName;
  final String description;
  final int population;
  final String localTime;
  final String currency;
  final String language;
  final String weather;
  final List<String> landmarks;
  final String transportation;
  final List<String> pointsOfInterest;
  final List<String> localEvents;

  CityInfo({
    required this.cityName,
    required this.description,
    required this.population,
    required this.localTime,
    required this.currency,
    required this.language,
    required this.weather,
    required this.landmarks,
    required this.transportation,
    required this.pointsOfInterest,
    required this.localEvents,
  });
}

final List<CityInfo> citysInfo = [
  CityInfo(
    cityName: "Berlin",
    description: "Description of Berlin",
    population: 3769495,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Sunny",
    landmarks: ["Brandenburg Gate", "Berlin Wall", "Museum Island"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Checkpoint Charlie", "Potsdamer Platz", "Alexanderplatz"],
    localEvents: ["Berlin International Film Festival", "Karneval der Kulturen"],
  ),
  CityInfo(
    cityName: "Hamburg",
    description: "Description of Hamburg",
    population: 1841179,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Cloudy",
    landmarks: ["Speicherstadt", "Hamburg Harbor", "St. Michael's Church"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Miniatur Wunderland", "Hamburg Rathaus", "Reeperbahn"],
    localEvents: ["Hamburg DOM", "Hamburger Dom"],
  ),
  CityInfo(
    cityName: "Munich",
    description: "Description of Munich",
    population: 1471508,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Rainy",
    landmarks: ["Marienplatz", "Neuschwanstein Castle", "English Garden"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Hofbräuhaus", "Nymphenburg Palace", "Olympiapark"],
    localEvents: ["Oktoberfest", "Christmas Markets"],
  ),
  CityInfo(
    cityName: "Cologne",
    description: "Description of Cologne",
    population: 1085664,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Partly cloudy",
    landmarks: ["Cologne Cathedral", "Hohenzollern Bridge", "Museum Ludwig"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Cologne Old Town", "Rhine River", "Lanxess Arena"],
    localEvents: ["Cologne Carnival", "Cologne Lights"],
  ),
  CityInfo(
    cityName: "Frankfurt",
    description: "Description of Frankfurt",
    population: 753056,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Windy",
    landmarks: ["Römer", "Frankfurt Cathedral", "Palmengarten"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Main Tower", "Goethe House", "Zeil Shopping Street"],
    localEvents: ["Frankfurt Book Fair", "Museumsuferfest"],
  ),
  CityInfo(
    cityName: "Stuttgart",
    description: "Description of Stuttgart",
    population: 635911,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Sunny",
    landmarks: ["Mercedes-Benz Museum", "Stuttgart State Gallery", "Stuttgart TV Tower"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Schlossplatz", "Wilhelma Zoo", "Porsche Museum"],
    localEvents: ["Cannstatter Volksfest", "Stuttgart Wine Festival"],
  ),
  CityInfo(
    cityName: "Düsseldorf",
    description: "Description of Düsseldorf",
    population: 619294,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Cloudy",
    landmarks: ["Rhine Tower", "Königsallee", "Media Harbor"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Old Town", "Rheinuferpromenade", "Aquazoo-Löbbecke-Museum"],
    localEvents: ["Rheinkirmes", "Japan Day Düsseldorf"],
  ),
  CityInfo(
    cityName: "Dortmund",
    description: "Description of Dortmund",
    population: 587010,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Rainy",
    landmarks: ["Signal Iduna Park", "Dortmund U-Tower", "Westfalenpark"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Phoenix-See", "DASA Arbeitswelt Ausstellung", "Hohensyburg Casino"],
    localEvents: ["Juicy Beats Festival", "Christmas Market Dortmund"],
  ),
  CityInfo(
    cityName: "Essen",
    description: "Description of Essen",
    population: 582624,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Partly cloudy",
    landmarks: ["Zollverein Coal Mine Industrial Complex", "Essen Cathedral", "Villa Hügel"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Baldeneysee", "Folkwang Museum", "Grugapark"],
    localEvents: ["Essen Light Festival", "Grugamarkt"],
  ),
  CityInfo(
    cityName: "Leipzig",
    description: "Description of Leipzig",
    population: 587857,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Windy",
    landmarks: ["Leipzig Zoo", "St. Thomas Church", "Monument to the Battle of the Nations"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Augustusplatz", "Leipzig Opera", "Panometer"],
    localEvents: ["Leipzig Book Fair", "Wave-Gotik-Treffen"],
  ),
  CityInfo(
    cityName: "Bremen",
    description: "Description of Bremen",
    population: 567559,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Sunny",
    landmarks: ["Bremen Town Hall", "Bremen Cathedral", "Schnoor Quarter"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Universum Bremen", "Böttcherstraße", "Bremen Roland"],
    localEvents: ["Freimarkt Bremen", "Bremer Musikfest"],
  ),
  CityInfo(
    cityName: "Dresden",
    description: "Description of Dresden",
    population: 556780,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Cloudy",
    landmarks: ["Dresden Frauenkirche", "Zwinger Palace", "Semperoper"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Elbe River", "Dresden Castle", "Neustadt District"],
    localEvents: ["Dresden Striezelmarkt", "Dresden Music Festival"],
  ),
  CityInfo(
    cityName: "Hanover",
    description: "Description of Hanover",
    population: 538068,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Rainy",
    landmarks: ["New Town Hall", "Herrenhausen Gardens", "Hanover Opera"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Maschsee", "Marktkirche", "Royal Gardens of Herrenhausen"],
    localEvents: ["Schützenfest Hannover", "Maschseefest"],
  ),
  CityInfo(
    cityName: "Nuremberg",
    description: "Description of Nuremberg",
    population: 518365,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: "Partly cloudy",
    landmarks: ["Nuremberg Castle", "Nuremberg Old Town", "Germanisches Nationalmuseum"],
    transportation: "Public transportation system",
    pointsOfInterest: ["Documentation Center Nazi Party Rally Grounds", "Albrecht Dürer's House", "St. Lorenz Church"],
    localEvents: ["Nuremberg Christkindlesmarkt", "Rock im Park"],
  ),
  CityInfo(
    cityName: " ",
    description: "Description of ",
    population: 0,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: " ",
    landmarks: [" ", " ", " "],
    transportation: "Public transportation system",
    pointsOfInterest: [" ", " ", " "],
    localEvents: [" ", " "],
  ),
  CityInfo(
    cityName: " ",
    description: "Description of ",
    population: 0,
    localTime: DateTime.now().toString(),
    currency: "Euro",
    language: "German",
    weather: " ",
    landmarks: [" ", " ", " "],
    transportation: "Public transportation system",
    pointsOfInterest: [" ", " ", " "],
    localEvents: [" ", " "],
  ),
];

class GermanCitiesApp extends StatefulWidget {
  GermanCitiesApp({super.key});

  final List<String> _imageUrls = [
    "https://media.cntraveler.com/photos/5b914e80d5806340ca438db1/1:1/w_2250,h_2250,c_limit/BrandenburgGate_2018_GettyImages-549093677.jpg7",
    "https://a.cdn-hotels.com/gdcs/production19/d1430/c53e41bd-1e9b-4c80-b15b-01e81b1c4679.jpg?impolicy=fcrop&w=800&h=533&q=medium",
    "https://cdn.britannica.com/06/152206-050-72BD5CAC/twin-towers-Church-of-Our-Lady-Munich.jpg",
    "https://lp-cms-production.imgix.net/2023-03/cologne-GettyImages-1144623412-rfc.jpeg",
    "https://media.cnn.com/api/v1/images/stellar/prod/190418141741-01-what-to-see-frankfurt-germany-photos.jpg?q=w_4191,h_2357,x_0,y_0,c_fill/w_1280",
    "https://en.stuttgart.de/medien/welcomeImages/GettyImages-c-nullplus-478297438-bearbeitet.jpg.scaled/1062a1f14774857c3ccac80e8f83f2f7.jpg",
    "https://a.cdn-hotels.com/gdcs/production61/d1121/6dfd3cfe-d31b-4514-b3af-aee8536223d1.jpg",
    "https://content.r9cdn.net/rimg/dimg/38/61/4f479618-city-32256-172608b0525.jpg?width=1200&height=630&xhint=1813&yhint=1557&crop=true",
    "https://media.essen.de/media/emg_1/essen_tourismus/bilder_neu_1/tourismus_4/erleben_2/DasistEssen_Skyline_peter_prengel_1920_1zu2.jpg",
    "https://images.prismic.io/indiecampers-demo/f8302bef-06d7-4063-8d8f-be4359674750_final+leipzig.jpg?auto=compress,format&rect=0,0,1996,1331&w=2000&h=1334",
    "https://www.bremen-convention.de/_Resources/Persistent/e75135ad3b5970303bb1743f2040bd4d561f8c23/RS53013_200423_026-943x628.jpg",
    "https://www.dresden.de/media/tourismus/sehenswuerdigkeiten/493x330_panorama_dresden_altstadt.jpg.scaled/944272df651acea2572d1e35d36caaf3.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Hannover_Blick_Neues_Rathaus_01.jpg/1200px-Hannover_Blick_Neues_Rathaus_01.jpg",
    "https://www.germany.travel/media/redaktion/content/staedte/nuernberg/Nuernberg_Blick_auf_den_Tiergaertnertorplatz.jpg",
    "https://image.jimcdn.com/app/cms/image/transf/dimension=4096x4096:format=jpg/path/sa6549607c78f5c11/image/idf6d09279ea1b3ad/version/1471191639/image.jpg",
    "https://content.r9cdn.net/rimg/dimg/08/8c/98d64b51-city-9410-1693517046b.jpg?width=1366&height=768&xhint=3561&yhint=2751&crop=true",
  ];

  final List<String> _imageNames = [
    "Berlin",
    "Hamburg",
    "Munich",
    "Cologne",
    "Frankfurt",
    "Stuttgart",
    "DÃsseldorf",
    "Dortmund",
    "Essen",
    "Leipzig",
    "Bremen",
    "Dresden",
    "Hanover",
    "Nuremberg",
    "",
    "",
  ];

  

  final List<LatLng> _cityCoordinates = [
    const LatLng(52.514629, 13.38923),
    const LatLng(53.54043, 9.9778286),
    const LatLng(48.135125, 11.581981),
    const LatLng(50.937531, 6.960279),
    const LatLng(50.110924, 8.682127),
    const LatLng(48.775418, 9.181758),
    const LatLng(51.227741, 6.773456),
    const LatLng(51.513587, 7.465298),
    const LatLng(51.458223, 7.015817),
    const LatLng(51.340632, 12.374732),
    const LatLng(53.079296, 8.801694),
    const LatLng(51.050407, 13.737262),
    const LatLng(52.375891, 9.732010),
    const LatLng(49.452103, 11.076665),
    const LatLng(0, 0),
    const LatLng(0, 0),
  ];

  @override
  _GermanCitiesAppState createState() => _GermanCitiesAppState();
}

class _GermanCitiesAppState extends State<GermanCitiesApp> {
  int _selectedIndex = -1;
  int _hoveredIndex = -1;

  bool _showMap = false;
  bool isMusicEnabled = false;
  bool isDarkModeEnabled = false;
  bool isLocationEnabled = false;

  String selectedLanguage = 'English';

  final customGray = const Color.fromARGB(255, 65, 65, 65);
  final customYellow = const Color.fromARGB(255, 206, 192, 3);

  MapController _mapController = MapController(); // Added MapController

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
  }

  void _onImageSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _showMap = true;
    });
  }

  void _onImageHovered(int index) {
    setState(() {
      _hoveredIndex = index;
    });
  }

  void _onImageExited() {
    setState(() {
      _hoveredIndex = -1;
    });
  }

  void _zoomIn() {
    _mapController.move(
        widget._cityCoordinates[_selectedIndex], _mapController.zoom + 1);
  }

  void _zoomOut() {
    _mapController.move(
        widget._cityCoordinates[_selectedIndex], _mapController.zoom - 1);
  }

Widget _buildCityGrid() {
  return Container(
    color: customGray, // Set the background color here
    child: Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: widget._imageUrls.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 1.0,
            ),
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context, int index) {
              return MouseRegion(
                onEnter: (_) => _onImageHovered(index),
                onExit: (_) => _onImageExited(),
                child: GestureDetector(
                  onTap: () => _onImageSelected(index),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: _hoveredIndex == index
                                ? customYellow
                                : Colors.transparent,
                            width: 5.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            widget._imageUrls[index],
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _hoveredIndex == index ? 0.6 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              widget._imageNames[index],
                              style: const TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Times New Roman',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 4.0,
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: customGray, // Set the footer background color here
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram, color:Color.fromARGB(255, 206, 192, 3)),
                  onPressed: () {
                    // Handle Instagram button tap
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook, color:Color.fromARGB(255, 206, 192, 3)),
                  onPressed: () {
                    // Handle Facebook button tap
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github, color:Color.fromARGB(255, 206, 192, 3)),
                  onPressed: () {
                    // Handle GitHub button tap
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
} 

Widget _buildCityInfo() {
  final CityInfo cityInfo = citysInfo[_selectedIndex];
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "${widget._imageNames[_selectedIndex]} Info",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Times New Roman',
        ),
      ),
      centerTitle: true,
      backgroundColor: customYellow,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
        onPressed: () {
          setState(() {
            _showMap = false;
            _selectedIndex = -1; // Reset the selected index
          });
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.map, size: 30.0, color: Colors.black),
          padding: const EdgeInsets.only(right: 10.0),
          onPressed: () {
            setState(() {
              _showMap = true;
            });
          },
        ),
      ],
    ),
    body: Container(
      color: customGray,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: customYellow,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    widget._imageNames[_selectedIndex],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    widget._imageUrls[_selectedIndex],
                    fit: BoxFit.cover,
                    height: 175,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Latitude: ${widget._cityCoordinates[_selectedIndex].latitude.toStringAsFixed(4)}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Longitude: ${widget._cityCoordinates[_selectedIndex].longitude.toStringAsFixed(4)}",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Description: ${cityInfo.description}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Population: ${cityInfo.population}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "LocalTime: ${cityInfo.localTime}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Currency: ${cityInfo.currency}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Language: ${cityInfo.language}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Weather: ${cityInfo.weather}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Landmarks: ${cityInfo.landmarks.join(', ')}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Transportation: ${cityInfo.transportation}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Points of interest: ${cityInfo.pointsOfInterest.join(', ')}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Local events: ${cityInfo.localEvents.join(', ')}",
                          style: const TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showMap = false;
                        _selectedIndex = -1;
                      });
                    },
                    child: Text("Go back"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shadowColor: customYellow,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    bottomNavigationBar: Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 4.0,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: customGray, // Set the footer background color here
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                color: Color.fromARGB(255, 206, 192, 3),
              ),
              onPressed: () {
                // Handle Instagram button tap
              },
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.facebook,
                color: Color.fromARGB(255, 206, 192, 3),
              ),
              onPressed: () {
                // Handle Facebook button tap
              },
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.github,
                color: Color.fromARGB(255, 206, 192, 3),
              ),
              onPressed: () {
                // Handle GitHub button tap
              },
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildMapContainer() {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget._imageNames[_selectedIndex]} Map",
        style: const TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold, 
          color: Colors.black,
          fontFamily: 'Times New Roman',
          ),
        ),
        centerTitle: true,
        backgroundColor: customYellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
          onPressed: () {
            setState(() {
              _showMap = false;
              _selectedIndex = -1; // Reset the selected index
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info,  size: 30, color: Colors.black),
            padding: const EdgeInsets.only(right: 16.0),
            onPressed: () {
              setState(() {
                _showMap = false;
              });
            },
          ),
        ],
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: widget._cityCoordinates[_selectedIndex],
          zoom: 13.0,
          maxZoom: 18,
          minZoom: 1,
        ),

        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: widget._cityCoordinates[_selectedIndex],
                builder: (ctx) => const Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 54, 54, 54),
                  shadows: [Shadow(color: Colors.black, offset:Offset(2, 2), blurRadius: 15)],
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: _zoomIn,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8.0),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: _zoomOut,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

Widget _settingsPage(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Settings',
        style: TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      shadowColor: customYellow,
    ),
    backgroundColor: customGray,
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isMusicEnabled = !isMusicEnabled;
              });
            },
            child: Container(
              color: customYellow,
              child: ListTile(
                title: const Text(
                  'Music',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Switch(
                  value: isMusicEnabled,
                  onChanged: (value) {
                    setState(() {
                      isMusicEnabled = value;
                    });
                  },
                  activeColor: Colors.black,
                  activeTrackColor: customGray,
                  inactiveTrackColor: customGray,
                  inactiveThumbColor: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          GestureDetector(
            onTap: () {
              _showThemeDialog(context);
            },
            child: Container(
              color: customYellow,
              child: ListTile(
                title: const Text(
                  'Theme Settings',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  isDarkModeEnabled ? Icons.brightness_2 : Icons.brightness_5,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
          GestureDetector(
            onTap: () {
              _showLanguageDialog(context);
            },
            child: Container(
              color: customYellow,
              child: const ListTile(
                title: Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          const SizedBox(height: 100),
          GestureDetector(
            onTap: () {
              _showLocationDialog(context);
            },
            child: Container(
              color: customYellow,
              child: const ListTile(
                title: Text(
                  'Location Settings',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 4.0,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: customGray, // Set the footer background color here
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                color: Color.fromARGB(255, 206, 192, 3),
              ),
              onPressed: () {
                // Handle Instagram button tap
              },
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.facebook,
                color: Color.fromARGB(255, 206, 192, 3),
              ),
              onPressed: () {
                // Handle Facebook button tap
              },
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.github,
                color: Color.fromARGB(255, 206, 192, 3),
              ),
              onPressed: () {
                // Handle GitHub button tap
              },
            ),
          ],
        ),
      ),
    ),
  );
}


void _showThemeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: customGray,
        title: const Text(
          'Theme Settings',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 206, 192, 3),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.brightness_5,
                color: Color.fromARGB(255, 206, 192, 3),
              ),
              title: const Text(
                'Light Mode',
                style: TextStyle(color: Color.fromARGB(255, 206, 192, 3)),
              ),
              onTap: () {
                setState(() {
                  isDarkModeEnabled = false;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.brightness_2,
                color: Color.fromARGB(255, 206, 192, 3),
              ),
              title: const Text(
                'Dark Mode',
                style: TextStyle(color: Color.fromARGB(255, 206, 192, 3)),
              ),
              onTap: () {
                setState(() {
                  isDarkModeEnabled = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

void _showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: customGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: FractionallySizedBox(
          widthFactor: 0.22,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Language Settings',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold, 
                    color: Color.fromARGB(255, 206, 192, 3),
                  ),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: Color.fromARGB(255, 206, 192, 3),
                  ),
                  title: const Text('English', style:TextStyle(
                    color: Color.fromARGB(255, 206, 192, 3)
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedLanguage = 'English';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: Color.fromARGB(255, 206, 192, 3),
                  ),
                  title: const Text('German', style:TextStyle(
                    color: Color.fromARGB(255, 206, 192, 3)
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedLanguage = 'German';
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: Color.fromARGB(255, 206, 192, 3),
                  ),
                  title: const Text('Bulgarian', style:TextStyle(
                    color: Color.fromARGB(255, 206, 192, 3)
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedLanguage = 'Bulgarian';
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


void _showLocationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: customGray, // Set the background color to customGray
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: FractionallySizedBox(
          widthFactor: 0.28,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Location Settings',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 206, 192, 3),
                  ),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 206, 192, 3),
                  ),
                  title: const Text(
                    'Show Your Location',
                    style: TextStyle(
                      color: Color.fromARGB(255, 206, 192, 3),
                    ),
                  ),
                  trailing: Switch(
                    value: isLocationEnabled,
                    onChanged: (value) {
                      setState(() {
                        isLocationEnabled = value;
                      });
                    },
                    activeColor: Colors.black,
                    activeTrackColor: customYellow,
                    inactiveTrackColor: customYellow,
                    inactiveThumbColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          shadowColor: customYellow,
          title: const Text(
            "German Cities",
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _settingsPage(context)),
              );
            },
          ),
        ),
        body: _showMap
            ? _buildMapContainer()
            : _selectedIndex != -1
                ? _buildCityInfo()
                : _buildCityGrid(),
      ),
    ),
  );
}

}