defmodule FutureMade.Core.Events.VenueCauseAdded do
  use TypedStruct

  typedstruct do
    # or String.t()
    field :venue_id, binary()
    field :cause_id, binary()
  end
end
