defmodule Gryplanszowe24.Paraller do
  @moduledoc """
    Paraller computation helper
  """

  @spec pmap([any], (any -> any)) :: [any]
  def pmap(collection, function) do
    collection
    |> Enum.map(&Task.async(fn -> function.(&1) end))
    |> Enum.map(&Task.await/1)
  end
end
