defmodule Exlivery.Factory do
  use ExMachina

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
end
