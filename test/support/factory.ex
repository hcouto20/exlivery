defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      address: "Rua das bananas, 749",
      name: "Pedro",
      email: "pedro@banana.com",
      cpf: "12345678900",
      age: 38
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

  def order_factory do
    %Order{
      delivery_address: "Rua das bananas, 749",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de salmão",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("17.5")
        )
      ],
      total_price: Decimal.new("83.90"),
      user_cpf: "12345678900"
    }
  end
end
