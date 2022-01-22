defmodule Exlivery.Orders.Report do
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Item, Order}

  def create(filename \\ "report.csv") do
    order_list = build_order_list()

    File.write(filename, order_list)
  end

  def build_order_list do
    OrderAgent.list_all()
    |> Map.values()
    |> Enum.map(fn order -> order_string(order) end)
    # |> Enum.map(&order_string(&1) end)
  end

  defp order_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    itens_string = Enum.map(items, fn item -> item_string(item) end)

    "#{cpf},#{itens_string}#{total_price}\n"
  end

  defp item_string(%Item{
         category: category,
         unity_price: unity_price,
         quantity: quantity
       }) do
    "#{category},#{quantity},#{unity_price},"
  end
end
