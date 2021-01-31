defmodule FutureMade.Core.Events.VenueRegistered do
  use TypedStruct

  typedstruct do
    field :venue_id, binary()
    field :venue_name, String.t()
    # coords, address
    field :location_info, term()
    # inside/outside
    field :capacity_info, term()
  end
end
