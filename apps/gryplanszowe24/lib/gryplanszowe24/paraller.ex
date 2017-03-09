defmodule Gryplanszowe24.Paraller do
  def pmap(collection, function) do
    me = self()
    collection
    |> Enum.map(fn(element) ->
      spawn_link(fn -> (send(me, {self(), function.(element)})) end)
    end)
    |> Enum.map(fn(pid) ->
      receive do
        {^pid, result} -> result
      end
    end)
  end
end
