import 'package:flutter/material.dart';
import 'package:new_concepts/error_handling/resocoder/post_change_notifier.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());

class ErrorHandlingResoCoder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
          create: (_) => PostChangeNotifier(), child: Home()),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Handling'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Consumer<PostChangeNotifier>(
              builder: (context, notifier, __) {
                if (notifier.state == NotifierState.initial)
                  return StyledText('Presee this button');
                else if (notifier.state == NotifierState.loading)
                  return CircularProgressIndicator();
                else {
                  return notifier.post.fold((l) => StyledText(l.toString()),
                      (r) => StyledText(r.toString()));
                }
                //
                // : FutureBuilder<Post>(
                // future: postFuture,
                // builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                // return CircularProgressIndicator();
                // } else if (snapshot.hasError) {
                // final error = snapshot.error;
                // return StyledText(error.toString());
                // } else if (snapshot.hasData) {
                // final post = snapshot.data;
                // return StyledText(post.toString());
                // } else {
                // return StyledText('Press the button 👇');
                // }
                // },
                // )
              },
            ),
            RaisedButton(
              child: Text('Get Post'),
              onPressed: () async {
                Provider.of<PostChangeNotifier>(context, listen: false)
                    .getOnePost();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(
    this.text, {
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40),
    );
  }
}
