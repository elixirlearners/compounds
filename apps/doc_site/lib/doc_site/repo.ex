defmodule DocSite.Repo do
  use Ecto.Repo,
    otp_app: :doc_site,
    adapter: Ecto.Adapters.SQLite3
end
