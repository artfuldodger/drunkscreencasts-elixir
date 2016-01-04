ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Drunkscreencasts.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Drunkscreencasts.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Drunkscreencasts.Repo)

