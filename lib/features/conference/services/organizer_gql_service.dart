import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/config/graphql_config.dart';
import '../models/organizer_model.dart';

class OrganizerGraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<OrganizerModel>> getConference(String confId) async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql(
            """
            query RootQuery(\$conferenceId: ID!) {
              conference(id: \$conferenceId) {
                partners {
                  ...SponsorFragment
                }
              }
            }

            fragment SponsorFragment on Contact {
              name
              social {
                homepage
              }
              about
              image {
                url
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
        List? res = result.data?['conference']['partners'];

        //
        // print(result.data?['conference']['partners']);
        //

        if (res == null || res.isEmpty) {
          return [];
        }

        List<OrganizerModel> conferencesData = res
            .map((conferenceData) =>
                OrganizerModel.fromJson(json: conferenceData))
            .toList();

        return conferencesData;
      }
    } catch (error) {
      log('Exception: $error');
      return [];
    }
  }
}
