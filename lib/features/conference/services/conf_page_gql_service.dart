import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/config/graphql_config.dart';
import '../models/conference_model.dart';

class ConfPageGraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<ConferenceModel>> getConference() async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql(
            """
            query ConferenceDayQuery {
              allSeries {
                id
                name
                conferences {
                  id
                  name
                  slogan
                  startDate
                }
              }
            }
            """,
          ),
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? res = result.data?['allSeries'];

        if (res == null || res.isEmpty) {
          return [];
        }

        List<ConferenceModel> conferencesData = res
            .map((conferenceData) =>
                ConferenceModel.fromJson(json: conferenceData))
            .toList();

        return conferencesData;
      }
    } catch (error) {
      log('Exception: $error');
      return [];
    }
  }
}
