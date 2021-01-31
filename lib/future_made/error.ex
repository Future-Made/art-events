defmodule FutureMade.Error do
   @moduledoc """
  A module to assist in creating our standard errors.
  """
  @type t :: {:error, %{type: atom(), error_message: binary(), error_data: map()}}
  @doc "Builds our standardized error with error metadata."
  @spec build(atom(), binary(), map()) :: t()
  def build(type, message, error_data) do
    {:error, %{type: type, error_message: message, error_data: error_data}}
  end
  @doc "Builds our standardized error."
  @spec build(atom(), binary()) :: t()
  def build(type, message) do
    {:error, %{type: type, error_message: message, error_data: %{}}}
  end
  @doc "Builds our standardized error and used type as message."
  @spec build(atom() | binary()) :: t()
  def build(type) when is_atom(type) do
    {:error, %{type: type, error_message: "#{type}", error_data: %{}}}
  end
  def build(message) when is_binary(message) do
    {:error, %{type: :general_error, error_message: message, error_data: %{}}}
  end

end
