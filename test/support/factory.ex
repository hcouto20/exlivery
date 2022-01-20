defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Helder",
      email: "helder@banana.com",
      cpf: "12345678900",
      age: 38,
      address: "Rua das bananas, 749"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      unity_price: Decimal.new("48.90"),
      quantity: 1
    }
  end
end
