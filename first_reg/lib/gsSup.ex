defmodule GsSup do
  use Supervisor
  
  
  # вспомогательный метод для запуска
  def start_link do
   
  {:ok,pid} = Supervisor.start_link(__MODULE__, [], [{:name, __MODULE__}])
   
   # {:ok,pid} = Supervisor.start_link(__MODULE__, [], [{:name, __MODULE__}])
    # Process.unlink(pid)
    # IO.puts("Genserver pid now is")
  #   Process.whereis(Gs)
  end
  
  
  # обратный вызов супервизора
  def init([]) do
    child = [worker(Gs, [], [])]
    supervise(child, [{:strategy, :one_for_one}, {:max_restarts, 1},  {:max_seconds, 5}])
  end
  
  
  # внутренние функции (здесь их нет)
end