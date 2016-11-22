defmodule Zendex.SearchTest do
  use ExUnit.Case, async: false

  setup do
    %{conn: Zendex.Connection.setup("http://test.zendesk.com", "User", "Passw")}
  end

  setup_all do
    :meck.new(HTTPoison)
    on_exit fn -> :meck.unload end
    :ok
  end

  test "doing a search", %{conn: conn} do
    stub = fn("http://test.zendesk.com/api/v2/search.json?query=requester%3AJimbob+type%3Aticket", _) ->
      %HTTPoison.Response{body: Poison.encode!(["Jimbob Ticket 1", "Jimbob Ticket 2"])}
    end
    :meck.expect(HTTPoison, :get!, stub)

    expected = ["Jimbob Ticket 1", "Jimbob Ticket 2"]

    actual = Zendex.Search.query(conn, %{type: "ticket", requester: "Jimbob"})

    assert actual == expected
  end

  test "doing a search with sorting", %{conn: conn} do
    stub = fn("http://test.zendesk.com/api/v2/search.json?query=requester%3AReginald+type%3Aticket&sort_by=created_at&sort_order=desc", _) ->
      %HTTPoison.Response{body: Poison.encode!(["Reginald Ticket 1", "Reginald Ticket 2"])}
    end
    :meck.expect(HTTPoison, :get!, stub)
    expected = ["Reginald Ticket 1", "Reginald Ticket 2"]

    actual = Zendex.Search.query(conn,
                                 %{type: "ticket", requester: "Reginald"},
                                 "created_at",
                                 "desc")

    assert actual == expected
  end

end
