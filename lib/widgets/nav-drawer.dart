import 'package:flutter/material.dart';
import 'package:interintel_interview/widgets/design.dart';
import 'package:interintel_interview/widgets/dictionary.dart';
import 'package:interintel_interview/widgets/response.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(158, 29, 157, 180),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                    'https://www.interintel.co.ke/media/upc_institution_logo/Interintel_Logo_1.png'),
              ),
            ),
            child: Center(
              child: Text(
                ' ',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info'),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.design_services),
            title: const Text('Design'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const Design(
                          sName: " ",
                          fName: " ",
                          email: " ",
                        )),
                  ))
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Response'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const Response()),
                  ))
            },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Dictionary'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MyDictionary()),
                  ))
            },
          ),
        ],
      ),
    );
  }
}
