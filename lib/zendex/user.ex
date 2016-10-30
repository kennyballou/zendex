defmodule Zendex.User do
  @moduledoc """
  Interact with Zendesk user.
  """

  alias Zendex.CommonHelpers

  @url "/api/v2/users"
  @http_client Application.get_env(:zendex, :http_client)

  @spec list(Zendex.Connection.t) :: map
  def list(connection) do
    connection.base_url
    |> Kernel.<>("#{@url}.json")
    |> @http_client.get!(CommonHelpers.get_headers(connection.authentication))
    |> CommonHelpers.decode_response
  end

  @spec show(Zendex.Connection.t, integer) :: map
  def show(connection, id) do
    connection.base_url
    |> Kernel.<>("#{@url}/#{id}.json")
    |> @http_client.get!(CommonHelpers.get_headers(connection.authentication))
    |> CommonHelpers.decode_response
  end

  @spec create(Zendex.Connection.t, map) :: map
  def create(connection, user) do
    connection.base_url
    |> Kernel.<>("#{@url}.json")
    |> @http_client.post!(Poison.encode!(user),
                          CommonHelpers.get_headers(connection.authentication,
                                                    %{content_type: :json}))
    |> CommonHelpers.decode_response
  end

end
