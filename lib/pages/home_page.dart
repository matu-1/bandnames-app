import 'package:bandnames/constants/bands_data.dart';
import 'package:bandnames/constants/common_page.dart';
import 'package:bandnames/constants/ui.dart';
import 'package:bandnames/models/band_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BandModel> _bands = BandModel.bandFromMapList(bandsData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames'),
      ),
      body: _bandList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBandDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bandList() {
    return ListView.builder(
      itemCount: _bands.length,
      itemBuilder: (BuildContext context, int index) {
        return _bandBox(_bands[index]);
      },
    );
  }

  Widget _bandBox(BandModel band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only(left: UI.padding),
        color: Colors.orange,
        alignment: Alignment.centerLeft,
        child: Text(
          'Delete band',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onDismissed: (direction) {},
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.initialName()),
        ),
        title: Text(band.name),
        trailing: Text(band.votes.toString()),
      ),
    );
  }

  void _addBandDialog() {
    String name;
    GlobalKey formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add new Band'),
        content: Form(
          key: formKey,
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (newValue) => name = newValue,
            onChanged: (value) => name = value,
            validator: (value) {
              if (value.length >= 3) return null;
              return 'Debe tener al menos 3 caracteres';
            },
          ),
        ),
        actions: [
          FlatButton(
              onPressed: () => _addNewBand(name, formKey),
              child: Text(CommonPage.add))
        ],
      ),
    );
  }

  void _addNewBand(String name, GlobalKey<FormState> formKey) {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    _bands.add(new BandModel(
      id: DateTime.now().toString(),
      name: name,
    ));
    setState(() {});
    print(name);
    Navigator.of(context).pop();
  }
}
