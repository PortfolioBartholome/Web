import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:portfolio_web/model/Knowledge.dart';
import 'package:portfolio_web/services/HttpManager.dart';
import 'package:portfolio_web/services/ResponseManager.dart';

class KnowledgeController {
  Future<List<Knowledge>> getAllKnowledge(
      {@required BuildContext context,
        @required GlobalConfiguration globalConfiguration}) async {
    HttpManager httpManager = HttpManager(
        path: 'knowledge',
        context: context,
        globalConfiguration: globalConfiguration);
    await httpManager.get();
    ResponseManager responseManager = ResponseManager(
      response: httpManager.response,
      context: context,
    );
    return getKnowledgeFromJson(jsonToDecode: responseManager.response.body);
  }

  List<Knowledge> getKnowledgeFromJson({@required String jsonToDecode}) {
    var knowledge = List<Knowledge>();
    Iterable list = json.decode(jsonToDecode);
    knowledge.addAll(list.map((model) => Knowledge.fromJson(model)).toList());
    return knowledge;
  }
}
