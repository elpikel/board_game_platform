defmodule Gryplanszowe24.PagesDownloadersSupervisor do
  use Supervisor

  def start_link(pages) do
    Supervisor.start_link(__MODULE__, {pages})
  end

  def init({pages}) do
    processes = for page_number <- 1..pages do
      worker(
        Gryplanszowe24.PageDownloader, [page_number],
        id: {:page_downloader, page_number}
      )
    end

    supervise(processes, strategy: :one_for_one)
  end
end
