defmodule Gryplanszowe24 do
  @moduledoc """
    Documentation for Gryplanszowe.
  """
  use GenServer
  use Timex

  def start_link do
    GenServer.start_link(__MODULE__, Timex.shift(Timex.now, minutes: -5), name: __MODULE__)
  end

  @doc """
  """
  def update_products do
    GenServer.cast(__MODULE__, :update_products)
  end

  def get_products do
    GenServer.call(__MODULE__, :get_products)
  end

  def handle_call(:get_products, _from, last_update) do
    products = Gryplanszowe24.ProductsPages.get_products(
                "http://www.gryplanszowe24.pl/639-gry-planszowe",
                &Gryplanszowe24.PageDownloader.download_page/1)
    {:reply, products, last_update}
  end

  def handle_cast(:update_products, last_update) do # use state for cache? or last call datetime
    should_update = Timex.before?(Timex.shift(last_update, minutes: 5), Timex.now)

    cond do
      should_update ->
        IO.puts "update"
        products = Gryplanszowe24.ProductsPages.get_products(
                    "http://www.gryplanszowe24.pl/639-gry-planszowe",
                    &Gryplanszowe24.PageDownloader.download_page/1)
        BoardGame.update_products(products)
        {:noreply, Timex.now}
      true ->
        IO.puts "do nothing"
        {:noreply, last_update}
    end

    # make worker for each page
    # add supervisor
    # think about caching
  end
end
