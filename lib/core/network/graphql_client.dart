import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static final HttpLink httpLink = HttpLink(
    'https://graphqlzero.almansi.me/api',
  );

  static GraphQLClient getClient() {
    return GraphQLClient(
      // We will use an in-memory cache for simplicity in this learning project
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }
}
