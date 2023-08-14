import 'package:atelier02_ui/data/session.dart';
import 'package:atelier02_ui/data/sp_helper.dart';
import 'package:flutter/material.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDurration = TextEditingController();
  SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updarteScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Treaining Sessions'),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Insert Training Session"),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
                TextField(
                  controller: txtDurration,
                  decoration: const InputDecoration(hintText: 'Duration'),
                )
              ],
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    txtDescription.text = '';
                    txtDurration.text = '';
                  },
                  child: const Text('Cancel')),
              ElevatedButton(onPressed: saveSession, child: const Text('Save'))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year} - ${now.month} - ${now.day}';
    int id = helper.getCounter();
    Session session = Session(
        id, today, txtDescription.text, int.tryParse(txtDurration.text) ?? 0);
    helper.writeSession(session).then((_) {
      updarteScreen();
      helper.setCounter();
    });
    txtDescription.text = '';
    txtDurration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(ListTile(
        title: Text(session.description),
        subtitle: Text('${session.date} - durration: ${session.duration} min'),
      ));
    }
    return tiles;
  }

  void updarteScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
