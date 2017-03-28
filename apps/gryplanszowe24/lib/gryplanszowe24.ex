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

  def update_categories do
    GenServer.cast(__MODULE__, :update_categories)
  end

  def get_products do
    GenServer.call(__MODULE__, :get_products)
  end

  def get_categories do
    GenServer.call(__MODULE__, :get_categories)
  end

  def handle_call(:get_categories, _from, last_update) do
    categories = Gryplanszowe24.CategoriesPage.get_categories(
    "http://www.gryplanszowe24.pl/639-gry-planszowe",
    &Gryplanszowe24.PageDownloader.download_page/1)

    {:reply, categories, last_update}
  end

  def handle_call(:get_products, _from, last_update) do
    products = Gryplanszowe24.ProductsPages.get_products(
                "http://www.gryplanszowe24.pl/639-gry-planszowe",
                &Gryplanszowe24.PageDownloader.download_page/1)
    {:reply, products, last_update}
  end

  def handle_cast(:update_products, last_update) do
    should_update = Timex.before?(Timex.shift(last_update, minutes: 5), Timex.now)

    cond do
      should_update ->
        products = Gryplanszowe24.ProductsPages.get_products(
                    "http://www.gryplanszowe24.pl/639-gry-planszowe",
                    &Gryplanszowe24.PageDownloader.download_page/1)
        BoardGame.update_products(products)
        {:noreply, Timex.now}
      true ->
        {:noreply, last_update}
    end

    # make worker for each page
    # add supervisor
    # think about caching
  end

  def handle_cast(:update_categories, last_update) do
    categories = Gryplanszowe24.CategoriesPage.get_categories(
    "http://www.gryplanszowe24.pl/639-gry-planszowe",
    &Gryplanszowe24.PageDownloader.download_page/1)

    BoardGame.update_categories(categories)

    {:noreply, last_update}
  end
end
