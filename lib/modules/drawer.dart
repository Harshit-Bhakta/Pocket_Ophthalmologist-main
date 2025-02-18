import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:pulse_social/Pages/Drawer/About_Us.dart";
import "package:pulse_social/Pages/Drawer/Insturctions.dart";
import "package:pulse_social/Pages/Drawer/Retina_Des.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _SingOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 43, 151, 239),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const DrawerHeader(
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.black,
                    size: 100,
                  ),
                ),

                //HOME LISTTILE

                const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        "RetinaXpert",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    )),

                const Divider(
                  color: Colors.white70,
                  thickness: 1,
                ),

                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 50,
                  ),
                  title: const Text(
                    "HOME PAGE",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                const Divider(
                  color: Colors.white70,
                  thickness: 1,
                ),

                //PROFILE LISTTILE

                ListTile(
                  leading: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.black,
                    size: 50,
                  ),
                  title: const Text(
                    "INSTURCTIONS",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Insturctions(),
                      ),
                    );
                  },
                ),

                const Divider(
                  color: Colors.white70,
                  thickness: 1,
                ),

                ListTile(
                  leading: const Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.black,
                    size: 50,
                  ),
                  title: const Text(
                    "RETINA  DISEASES",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RetDes(),
                      ),
                    );
                  },
                ),

                const Divider(
                  color: Colors.white70,
                  thickness: 1,
                ),

                ListTile(
                  leading: const Icon(
                    Icons.people_sharp,
                    color: Colors.black,
                    size: 50,
                  ),
                  title: const Text(
                    "ABOUT US",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUs(),
                      ),
                    );
                  },
                ),

                const Divider(
                  color: Colors.white70,
                  thickness: 1,
                ),

                const SizedBox(
                  height: 220,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 179, 21, 9),
                    size: 40,
                  ),
                  title: const Text(
                    "L O G O U T ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 179, 21, 9), fontSize: 30),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _SingOut();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
