part of pokeapiclient;

class PokemonPokemonApi {
  final ApiClient apiClient;

  PokemonPokemonApi(ApiClient apiClient) : apiClient = apiClient;

  Future<PaginationPokemon> getAll({int offset = 0}) async {
    final queryParams = <String, dynamic>{};

    if (offset != null) {
      queryParams['offset'] = offset.toString();
    }

    queryParams['limit'] = '20';

    final baseUri = Uri.tryParse(apiClient.baseUrl);
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

    final baseUri = Uri.tryParse(apiClient.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: baseUri.path + '/pokemon/$id/');

    return await apiClient.dio
        .getUri(
      uri,
    )
        .then((response) {
      return PokemonData.fromJson(response.data);
    });
  }
}
