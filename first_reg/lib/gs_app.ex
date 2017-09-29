defmodule GsApp do
  
   use Application

   def start(_type, _args) do
  Supervisor.start_link(__MODULE__,[],[{:name,__MODULE__}])
  end

@doc "start_link запускает init где мы настраиваем параметры"
  def init([]) do
    import Supervisor.Spec, warn: false
    child = [supervisor(GsSup,[],[])]
    supervise(child,[{:strategy,:one_for_one},{:max_restarts,1},{:max_seconds, 5}])

  end
end