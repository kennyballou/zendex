defmodule Zendex.HttpClient.InMemory do
  @moduledoc """
  Allows testing of the Zendex project by mocking out calls to an actual Zendesk
  API.
  """

  def get!("http://test.zendesk.com/api/v2/tickets.json",
           [{"Authorization", _authentication}]) do
    fake_response("ticket")
  end

  def get!("http://test.zendesk.com/api/v2/search.json?query=requester%3AJimbob+type%3Aticket",
           [{"Authorization", _authentication}]) do
    fake_response(["Jimbob Ticket 1", "Jimbob Ticket 2"])
  end

  def get!("http://test.zendesk.com/api/v2/search.json?query=requester%3AReginald+type%3Aticket&sort_by=created_at&sort_order=desc",
           [{"Authorization", _authentication}]) do
    fake_response(["Reginald Ticket 1", "Reginald Ticket 2"])
  end

  def post!("http://test.zendesk.com/api/v2/tickets.json", "{\"ticket\":{}}", [{"Authorization", _authentication}, {"Content-Type", "application/json"}]) do
    fake_response("Ticket created successfully!")
  end

  defp fake_response(body), do: %{body: Poison.encode!(body)}
end
