defmodule Exlivery.Users.User do

  @keys [:name, :email, :cpf, :age]
  @enforce_keys [:email]

  defstruct @keys
end
