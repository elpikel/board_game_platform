defmodule Gryplanszowe24.PageDownloader do
  @moduledoc """
    Used for download page
  """

  @spec download_page(String.t) :: String.t
  def download_page(url) do
    HTTPoison.get!(url).body
  end
end
