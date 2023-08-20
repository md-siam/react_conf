import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/config/graphql_config.dart';
import '../models/conference_detail_model.dart';

class ConfDetailPageGraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<ConferenceDetailModel>> getConference(String confId) async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql(
            """
            query PageQuery(\$conferenceId: ID!) {
              conference(id: \$conferenceId) {
                schedules {
                  day
                  description
                  intervals {
                    begin
                    end
                    title
                    sessions {
                      type
                      title
                      description

                      people {
                        name
                        image {
                          url
                        }
                      }
                    }
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
        List? res = result.data?['conference']['schedules'];

        //
        //print(result.data?['conference']['schedules']);
        //

        if (res == null || res.isEmpty) {
          return [];
        }

        List<ConferenceDetailModel> conferencesData = res
            .map((conferenceData) =>
                ConferenceDetailModel.fromJson(json: conferenceData))
            .toList();

        return conferencesData;
      }
    } catch (error) {
      log('Exception: $error');
      return [];
    }
  }
}
