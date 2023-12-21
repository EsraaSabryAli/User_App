import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_second/Pages/test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Residential = [];

  void getResidintial() async {
    CollectionReference tblProduct =
        FirebaseFirestore.instance.collection('ResidentialProperty');
    await tblProduct.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> store = doc.data() as Map<String, dynamic>;
        store['documentId'] = doc.id;
        Residential.add(store);
        print(store);
      });
    });
    //print('-------------------------------');
    setState(() {});
  }

  @override
  void initState() {
    getResidintial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("LoginPage", (route) => false);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        title: Center(child: Text('Home Page')),
      ),
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 0,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                  //backgroundImage: AssetImage('assets/user_profile.jpg'),
                  ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(118, 165, 209, 1),
              ),
            ),
            SizedBox(height: 50),
            ListTile(
              title: const Text('Edit your profile'),
              leading: Icon(Icons.edit),
              onTap: () {
                // Handle tap on Home
              },
            ),
            ListTile(
              title: const Text('Favourites'),
              leading: Icon(Icons.favorite),
              onTap: () {
                // Handle tap on Settings
              },
            ),
            ListTile(
              title: const Text('Notifactions'),
              leading: Icon(Icons.notifications),
              onTap: () {
                // Handle tap on Settings
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              leading: Icon(Icons.contact_support),
              onTap: () {
                // Handle tap on Settings
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: Icon(Icons.logout),
              onTap: () {
                // Handle tap on Home
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find your best ',
              style: TextStyle(
                color: Color.fromRGBO(56, 73, 106, 1),
                fontSize: 30,
              ),
            ),

            Text(
              'Property ',
              style: TextStyle(
                color: Color.fromRGBO(56, 73, 106, 1),
                fontSize: 30,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(213, 215, 219, 1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Categories ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                // SizedBox(width: 25),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.house,
                    size: 40,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Residential',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(180.0, 60.0),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Add some space between buttons
                ElevatedButton.icon(
                  onPressed: () {
                    // Add your logic for the second button
                  },
                  icon: Icon(
                    Icons.apartment,
                    size: 40,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Commercial',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(180.0, 60.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Featured Properties ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),
            //   SizedBox(width: 500),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      getResidintial();
                    },
                    child: const Text('View All'))
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Residential.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Ss(data: Residential[index],))) ;
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: 100,
                      color: Colors.grey,
                      child: Text("${Residential[index]['phoneNumber']} \n ${Residential[index]['phoneNumber']} " ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
