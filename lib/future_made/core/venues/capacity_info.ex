defmodule FutureMade.Core.Venues.CapacityInfo do
  use TypedStruct

  typedstruct do
    field :capacity_inside, Integer.t()
    field :capacity_outside, Integer.t()
  end
end
