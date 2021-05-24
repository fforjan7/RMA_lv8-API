import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rma_lv8/models/university.dart';
import 'package:rma_lv8/screens/api_manager.dart';

class UniversityScreen extends StatefulWidget {
  @override
  _UniversityScreenState createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
  late Future<List<University>> _university;

  @override
  void initState() {
    _university = API_Manager().getUniversities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Popis Sveučilišta'),
      ),
      child: SafeArea(
        child: FutureBuilder<List<University>>(
          future: _university,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Future.delayed(
                Duration(seconds: 1),
                () => showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Error'),
                      content: Text(
                          'URLSessionTask failed with error; The Internet connection appears to be offline.'),
                      actions: [
                        CupertinoDialogAction(
                          child: Text('Ok'),
                        )
                      ],
                    );
                  },
                ),
              );
            }
            if (snapshot.hasData) {
              return ListView.separated(
                  itemCount: snapshot.data?.length ?? 0,
                  separatorBuilder: (context, index) => Divider(
                        color: CupertinoColors.black,
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data![index].name),
                          SizedBox(height: 8.0),
                          Text(snapshot.data![index].country),
                          SizedBox(height: 8.0),
                          Text(snapshot.data![index].url),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
