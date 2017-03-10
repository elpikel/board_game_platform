defmodule Gryplanszowe24.Product do
  @moduledoc """
    Represents board game
  """
  defstruct title: "", description: "", price: 0.0, image: "", url: ""
  @type t :: %Gryplanszowe24.Product{title: String.t, description: String.t, price: float, image: String.t, url: String.t}
end
