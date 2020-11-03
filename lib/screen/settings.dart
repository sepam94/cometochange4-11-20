
import 'package:cometochange/screen/home.dart';
import 'package:cometochange/screen/login.dart';
import 'package:flutter/material.dart';

 
class Settings extends StatefulWidget {
    static const routeName = '/Settings';
 
    @override
    State<StatefulWidget> createState() {
        return _SettingsState();
    }
}
 
class _SettingsState extends State<Settings> {
 
    @override
    Widget build(BuildContext context) {
 
        return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(title: Text('Setting'),backgroundColor: Colors.orange[800],),
      body: Container(
        color: Colors.blueGrey[100],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                      title: Text('User Name'),
                      trailing: Icon(Icons.edit),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      title: Text('เปลี่ยนรหัสผ่าน'),
                      trailing: Icon(Icons.edit),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.help_outline,
                        color: Colors.grey,
                      ),
                      title: Text('คู่มือการใช้งาน'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      ),
                      title: Text('เวอร์ชั่นของแอปพลิเคชัน'),
                      trailing: Text('1.0.0'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.power_settings_new,
                        color: Colors.grey,
                      ),
                      title: Text('ออกจากระบบ'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}