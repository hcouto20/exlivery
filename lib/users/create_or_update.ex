defmodule Exlivery.Users.CreateOrUpdate do
  alias Exlivery.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%{address: address, name: name, email: email, cpf: cpf, age: age}) do
    address
    |> User.build(name, email, cpf, age)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}), do: UserAgent.save(user)

  defp save_user({:error, _reason} = error), do: error
end
