import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter_http/post_model.dart';

class HttpService
{
  final String postUrl="";

  Future<List<Post>> getPosts() async
  {
    Response res=await get(postUrl);
    if(res.statusCode==200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> Posts = body.map((dynamic item) => Post.fromjson(item))
          .toList();
      return Posts;
    }
        else
          {
            throw "can't get posts"; '
          }

      }
  }
