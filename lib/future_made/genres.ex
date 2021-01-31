defmodule FutureMade.Genres do
  use TypedStruct

  typedstruct module: Genre do
    field :name, String.t(), enforce: true
  end

  def get_all do
    %{"1" => %Genre{name: "Rock"}, "2" => %Genre{name: "Electronic"}, "3" => %Genre{name: "Jazz"}}
  end
end
