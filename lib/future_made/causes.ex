defmodule FutureMade.Causes do
  use TypedStruct

  typedstruct module: Cause do
    field :name, String.t(), enforce: true
  end

  def get_all do
    %{
      "1" => %Cause{name: "Climate Change"},
      "2" => %Cause{name: "Powerty"},
      "3" => %Cause{name: "Health"}
    }
  end
end
