defmodule FutureMade.Core.Venues.Commands do
  use TypedStruct

  alias FutureMade.Core.Venues.CapacityInfo

  typedstruct module: RegisterVenue do
    # or String.t()
    field :venue_id, binary()
    field :venue_name, String.t()
    # coords, address
    field :location_info, term()
    # inside/outside
    field :capacity_info, CapacityInfo
  end

  typedstruct module: AddVenueCause do
    # or String.t()
    field :venue_id, binary()
    field :cause_id, binary()
  end

  typedstruct module: AddVenueGenre do
    field :venue_id, binary()
    field :genre_id, binary()
  end
end
