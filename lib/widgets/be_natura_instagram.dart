import 'dart:convert';

import 'package:be_natura/widgets/components/view/bn_circular_progress_indicator.dart';
import 'package:be_natura/widgets/components/view/bn_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeNaturaInstagram extends StatefulWidget {

  const BeNaturaInstagram({
    Key? key,
  }) : super(key: key);

  @override
  State<BeNaturaInstagram> createState() => _BeNaturaInstagramState();
}

class _BeNaturaInstagramState extends State<BeNaturaInstagram> {
  /// Instagram urls feed *
  List imagesUrl = [];

  String url = "https://www.instagram.com/";

  //String? _followers, _following, _website, _bio, _imgurl, _username;
  List<String>? _feedImagesUrl;

  bool downloading = true;

  Future<List<String>?> fetchDataFromInstagram() async {

    debugPrint("fetchDataFromInstagram()");

    if (imagesUrl.isEmpty) {

      debugPrint("request()");
      final response = await http.get(Uri.parse(
          'https://www.instagram.com/benaturacaiandfood/?__a=1&__d=dis'));

      debugPrint("response()${response.statusCode}");

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        var data = json.decode(response.body);
        var graphql = data['graphql'];
        var user = graphql['user'];
        /*var biography = user['biography'];
        _bio = biography;
        var myfollowers = user['edge_followed_by'];
        var myfollowing = user['edge_follow'];
        _followers = myfollowers['count'].toString();
        _following = myfollowing['count'].toString();
        _website = user['external_url'];
        _imgurl = user['profile_pic_url_hd'];
        this._username = "benaturacaiandfood";*/
        _feedImagesUrl = user['edge_owner_to_timeline_media']['edges']
            .map<String>((image) => image['node']['display_url'] as String)
            .toList();
        imagesUrl = _feedImagesUrl!.cast<String>();
        return _feedImagesUrl;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.+
        throw Exception('Failed to load instagram');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>?>(
      future: fetchDataFromInstagram(),
      builder: (context, snapshot) {
        return (_feedImagesUrl!=null && _feedImagesUrl!.isNotEmpty)
            ? BNGridView.grid(_feedImagesUrl, () {}, context)
            : BNCircularProgressIndicator
            .circularProgress();
      },
    );
  }
}