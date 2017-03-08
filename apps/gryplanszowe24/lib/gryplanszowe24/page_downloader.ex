defmodule Gryplanszowe24.PageDownloader do
  def download_page(url) do
    HTTPoison.get!(url).body
  end
end
