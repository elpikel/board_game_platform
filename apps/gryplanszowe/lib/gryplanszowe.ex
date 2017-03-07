defmodule Gryplanszowe do
  @moduledoc """
  Documentation for Gryplanszowe.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gryplanszowe.get_games
      []

  """
  def get_games do
    HTTPoison.get!("http://www.gryplanszowe24.pl/639-gry-planszowe").body
    |> parse
    # get http content
    # parse http content
    # make domain models
    # save to local db

    # get pages
    # make worker for each page
    # add supervisor
    # think about caching
    
  end

  def parse(html) do
    []
  end
end
