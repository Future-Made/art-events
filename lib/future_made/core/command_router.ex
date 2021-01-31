defmodule FutureMade.Core.CommandRouter do
  use Commanded.Commands.Router

  alias FutureMade.Core.Venues

  dispatch([
    Venues.Commands.RegisterVenue,
    Venues.Commands.AddVenueCause,
    Venues.Commands.AddVenueGenre
    ],
    to: Venues.Venue,
    identity: :venue_id,
    identity_prefix: "venue-"
  )
end
