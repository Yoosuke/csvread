defmodule Csvread do
  @moduledoc """
  Documentation for Csvread.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Csvread.hello()
      :world

  """
  def read(file_path) do
    [head | tail] = stream(file_path)
    csv_struct(head, tail)
    |> map
  end

  def stream(file_path) do
   File.stream!(file_path)
    |> CSV.decode
    |> Enum.to_list
    |> Enum.map(fn row -> tuple_to_list(row) end)
  end

  def csv_struct(head, tail) do
    %Data_csv{columns: head, rows: tail }
  end

  def map(result) do
    Enum.map(result.rows, fn row -> get(result.columns, row) end )
  end

  defp get(column, row) do
    List.zip([ column, row ])
    |> Enum.into(%{})
  end

  defp tuple_to_list(tuple_data) do
    case tuple_data do
      {:ok, list_data} -> list_data
      {:error, _list_data } -> []
    end
  end

end
