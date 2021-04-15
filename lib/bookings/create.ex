defmodule Flightex.Bookings.Create do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def call(user_id, %{
    data_completa: data_completa,
    cidade_origem: cidade_origem,
    cidade_destino: cidade_destino,
  }) do
    Booking.build(data_completa, cidade_origem, cidade_destino, user_id)
    |> save_user()
  end

  defp save_user({:ok, %Booking{id: id} = booking}) do
    BookingAgent.save(booking)

    {:ok, id}
  end

  defp save_user({:error, _reason} = error), do: error
end
