defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build("João Alves", "helder@banana.com", "12345678900", 38, "Rua das bananas, 749")

      expected_response = {:ok, build(:user, name: "João Alves")}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build("Junior", "helder@banana.com", "05566664610", 17, "Rua das bananas, 749")

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
