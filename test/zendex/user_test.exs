defmodule Zendex.UserTest do
  use ExUnit.Case, async: true

  setup do
    [conn: Zendex.Connection.set_up("http://test.zendesk.com", "User1", "pass")]
  end

  test "creating a user", context do
    expected = %{"user" => %{"id" => 1234, "name" => "Roger", "email" => "roger@dodger.com"}}
    actual = Zendex.User.create(context[:conn], %{user: %{name: "Roger", email: "roger@dodger.com"}})

    assert expected == actual
  end
end
