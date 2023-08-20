import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:react_conf/core/config/graphql_config.dart';
import 'package:react_conf/features/conference/models/conference_model.dart';

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
                  schedules {
                    day
                  }
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

        List<ConferenceModel> feelings = res
            .map((feeling) => ConferenceModel.fromJson(json: feeling))
            .toList();

        return feelings;
      }
    } catch (error) {
      return [];
    }
  }
}
