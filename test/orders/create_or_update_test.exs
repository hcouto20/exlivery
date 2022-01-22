defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup  do
      Exlivery.start_agents()

      cpf = "12345678911"
      user = build(:user, cpf: cpf)

      UserAgent.save(user)

      item1 = build(:item)
      item2 = build(:item, description: "Pizza de calabreza", unity_price: "33.20")

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves the order", %{user_cpf: cpf, item1: item1, item2: item2} do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns an error", %{item1: item1, item2: item2} do
      params = %{user_cpf: "00011122233", items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      expected_response =  {:error, "User not found"}

      assert response == expected_response
    end

    test "when there are invalid itens, returns an error", %{user_cpf: cpf, item1: item1, item2: item2} do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid items"}

      assert response == expected_response
    end

    test "when there are no items, returns an error", %{user_cpf: cpf} do
      params = %{user_cpf: cpf, items: []}

      response = CreateOrUpdate.call(params)

      expected_response =  {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
