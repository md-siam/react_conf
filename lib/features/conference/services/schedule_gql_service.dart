import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/config/graphql_config.dart';
import '../models/schedule_model.dart';

class ScheduleGraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<ScheduleModel>> getConference(String confId) async {
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
        // print(result.data?['conference']['partners']);
        //

        if (res == null || res.isEmpty) {
          return [];
        }

        List<ScheduleModel> conferencesData = res
            .map((conferenceData) =>
                ScheduleModel.fromJson(json: conferenceData))
            .toList();

        return conferencesData;
      }
    } catch (error) {
      log('Exception: $error');
      return [];
    }
  }
}
