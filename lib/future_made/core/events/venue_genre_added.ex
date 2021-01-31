defmodule FutureMade.Core.Events.VenueGenreAdded do
  use TypedStruct

  typedstruct do
    # or String.t()
    field :venue_id, binary()
    field :genre, binary()
  end
end
