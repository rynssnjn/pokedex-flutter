part of pokeapiclient;

class PokemonPokemonApi {
  final ApiClient apiClient;

  PokemonPokemonApi(ApiClient apiClient) : apiClient = apiClient;

  Future<PaginationPokemon> getAll({int? offset}) async {
    final queryParams = <String, dynamic>{};

    if (offset != null) {
      queryParams['offset'] = offset.toString();
    }

    queryParams['limit'] = '20';

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: baseUri.path + '/pokemon/');

    return await apiClient.dio
        .getUri(
      uri,
    )
        .then((response) {
      return PaginationPokemon.fromJson(response.data);
    });
  }

  Future<PokemonData> getById(int id) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: baseUri.path + '/pokemon/$id/');

    return await apiClient.dio
        .getUri(
      uri,
    )
        .then((response) {
      return PokemonData.fromJson(response.data);
    });
  }

  Future<PokemonSpecies> getSpeciesById(int id) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: baseUri.path + '/pokemon-species/$id/');

    return await apiClient.dio
        .getUri(
      uri,
    )
        .then((response) {
      return PokemonSpecies.fromJson(response.data);
    });
  }

  Future<Map> getEvolutionChainById(int id) async {
    final uri = Uri.parse('${apiClient.baseUrl}/evolution-chain/$id/');
    return await http.get(uri).then((response) => jsonDecode(response.body)['chain']);
  }
}
