defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "12345678900,pizza,1,48.90,japonesa,2,17.5,83.90\n" <>
          "12345678900,pizza,1,48.90,japonesa,2,17.5,83.90\n"

      assert response == expected_response
    end
  end
end
