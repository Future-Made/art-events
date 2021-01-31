defmodule FutureMade.Core.Venues.Venue do
  use TypedStruct

  alias __MODULE__

  alias FutureMade.Error

  alias FutureMade.Core.Events.{
    VenueRegistered,
    VenueCauseAdded,
    VenueGenreAdded
  }

  alias FutureMade.Core.Venues.Commands.{
    RegisterVenue,
    AddVenueCause,
    AddVenueGenre
  }

  @moduledoc """
  the venue aggregate. put info that aggregate processes itself here.
  """

  typedstruct do
    field :id, binary()
    field :registered_genres, list(binary()), default: []
    field :registered_causes, list(binary()), default: []

  end

  # newly created venue
  def execute(%Venue{id: nil}, %RegisterVenue{} = cmd) do
    # return event for command
    %VenueRegistered{venue_id: cmd.venue_id, venue_name: cmd.venue_name, capacity_info: cmd.capacity_info, location_info: cmd.location_info}
  end

  def execute(%Venue{id: id}, %RegisterVenue{} = cmd) when is_binary(id) do
    # return event for command
    Error.build("Venue already registered")
  end

  def execute(%Venue{id: nil}, _) do
    # return event for command
    Error.build("Venue not registered")
  end

  def execute(%Venue{} = state, %AddVenueGenre{} = cmd) do

    unless Enum.member?(state.registered_genres, cmd.genre_id) do
      %VenueGenreAdded{venue_id: cmd.venue_id, genre_id: cmd.genre_id}
    end
  end

  def execute(%Venue{} = state, %AddVenueCause{} = cmd) do

    unless Enum.member?(state.registered_causes, cmd.cause_id) do
      %VenueCauseAdded{venue_id: cmd.venue_id, cause_id: cmd.cause_id}
    end
  end


  def apply(%Venue{}, %VenueRegistered{} = evt) do
    %Venue{id: evt.venue_id}
  end

  # u
  def apply(%Venue{} = state, %VenueGenreAdded{} = evt) do

    %Venue{state | registered_genres: [evt.genre_id | state.registered_genres]}
  end

  def apply(%Venue{} = state, %VenueCauseAdded{} = evt) do

    %Venue{state | registered_causes: [evt.cause_id | state.registered_causes]}
  end
end
