import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/config/graphql_config.dart';
import '../models/sponsor_model.dart';

class GoldSponsorGraphQLService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<SponsorModel>> getConference(String confId) async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql(
            """
            query RootQuery(\$conferenceId: ID!) {
              conference(id: \$conferenceId) {
                goldSponsors {
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
        List? res = result.data?['conference']['goldSponsors'];

        //
        // print(result.data?['conference']['goldSponsors']);
        //

        if (res == null || res.isEmpty) {
          return [];
        }

        List<SponsorModel> conferencesData = res
            .map(
                (conferenceData) => SponsorModel.fromJson(json: conferenceData))
            .toList();

        return conferencesData;
      }
    } catch (error) {
      log('Exception: $error');
      return [];
    }
  }
}
