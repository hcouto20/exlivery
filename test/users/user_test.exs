defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build("Helder", "helder@banana.com", "05566664610", 38, "Rua das bananas, 749")

      expected_response =
        {:ok,
         %User{
           address: "Rua das bananas, 749",
           age: 38,
           cpf: "05566664610",
           email: "helder@banana.com",
           name: "Helder"
         }}

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
