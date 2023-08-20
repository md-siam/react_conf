import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/config/graphql_config.dart';
import '../models/speaker_model.dart';

class SpeakerGraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<SpeakerModel>> getConference(String confId) async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql(
            """
            query PageQuery(\$conferenceId: ID!) {
              conference(id: \$conferenceId) {
                speakers {
                  name
                  about
                  social {
                    homepage
                    github
                    twitter
                    linkedin
                  }
                  image {
                    url
                  }
                  country {
                    code
                  }
                }
              }
            }
            """,
          ),
          variables: {
            'conferenceId': confId,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? res = result.data?['conference']['speakers'];

        //
        // print(result.data?['conference']['speakers']);
        //

        if (res == null || res.isEmpty) {
          return [];
        }

        List<SpeakerModel> conferencesData = res
            .map(
                (conferenceData) => SpeakerModel.fromJson(json: conferenceData))
            .toList();

        return conferencesData;
      }
    } catch (error) {
      log('Exception: $error');
      return [];
    }
  }
}
