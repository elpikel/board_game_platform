defmodule Gryplanszowe24 do
  @moduledoc """
    Documentation for Gryplanszowe.
  """
  
  @doc """
  """
  def update_products do
    products = get_products()

    BoardGame.update_products(products)


    # get pages
    # make worker for each page
    # add supervisor
    # think about caching
  end

  def get_products do
    Gryplanszowe24.ProductsPages.get_products(
                "http://www.gryplanszowe24.pl/639-gry-planszowe",
                &Gryplanszowe24.PageDownloader.download_page/1)
  end
end
