import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:favorite_button/favorite_button.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  navigatetoNews() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => News()));
  }

  var api = "https://api.first.org/data/v1/news";
  var res, data;
  Set<String> savedWords = Set<String>();

  @override
  void initState() {
    super.initState();

    fetchNewsData();
  }

  fetchNewsData() async {
    res = await http.get(api);
    data = jsonDecode(res.body)["data"];
    print(data.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isSaved = savedWords.contains(data);

    return Container(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          padding: EdgeInsets.symmetric(vertical: 0.0),
          color: Color(0xffF3E5F5),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: res != null
                      ? ListView.builder(
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data.length - 1,
                          itemBuilder: (context, index) {
                            var state = data[index + 1];
                            return Card(
                              elevation: 10.0,
                              child: Container(
                                height: 120.0,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Row(
                                  children: [
                                    FavoriteButton(
                                      isFavorite: false,
                                      valueChanged: (_isFavourite) {
                                        setState(() {
                                          data.add(data[0]);
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "${state["title"]}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${state["summary"]}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              softWrap: false,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              "${state["published"]}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              softWrap: false,
                                              style: TextStyle(
                                                  color: Colors.black26,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : CircularProgressIndicator(
                          backgroundColor: Colors.white),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.blue,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.read_more,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              child: Text(
                                "News",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                navigatetoNews();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.green,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "♥ Favourite",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
}
