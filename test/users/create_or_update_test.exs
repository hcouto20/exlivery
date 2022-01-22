defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        address: "Rua das bananeiras, 749",
        name: "João Alves",
        email: "joao@banana.com",
        cpf: "12378945600",
        age: 74
      }

      response = CreateOrUpdate.call(params)

      expected_response =  {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid, returns an error" do
      params = %{
        address: "Rua das bananeiras, 749",
        name: "João Alves",
        email: "joao@banana.com",
        cpf: "12378945600",
        age: 17
      }

      response = CreateOrUpdate.call(params)

      expected_response =  {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
