defmodule FutureMade.Core.Venues do
  @moduledoc """
  Venues are there to host events...
  """

  alias FutureMade.Core
  alias FutureMade.Core.Venues.Venue
  alias FutureMade.Error

  alias FutureMade.Core.Venues.Commands.{
    RegisterVenue,
    AddVenueCause,
    AddVenueGenre
  }

  # define funcs that create command and dispatches

  @spec register_venue(map()) :: {:ok, Venue.t()} | Error.t()
  def register_venue(attrs) do
    RegisterVenue
    |> struct(attrs)
    |> Map.put(:venue_id, UUID.uuid4)
    |> Core.dispatch(returning: :aggregate_state)
  end

  @spec add_venue_cause(map()) :: {:ok, Venue.t()} | Error.t()
  def add_venue_cause(attrs) do
    AddVenueCause
    |> struct(attrs)
    |> Core.dispatch(returning: :aggregate_state)
  end


  @spec add_venue_genre(map()) :: {:ok, Venue.t()} | Error.t()
  def add_venue_genre(attrs) do
    AddVenueGenre
    |> struct(attrs)
    |> Core.dispatch(returning: :aggregate_state)
  end


end
