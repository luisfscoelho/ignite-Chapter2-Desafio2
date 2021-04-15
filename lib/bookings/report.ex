defmodule Flightex.Bookings.Report do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def generate(from_date, to_date, filename \\ "report.csv") do
    booking_list = build_booking_list(from_date, to_date)

    File.write(filename, booking_list)
  end

  defp build_booking_list(from_date, to_date) do
    BookingAgent.list()
    |> Map.values()
    |> Enum.filter(&filter_date(&1, from_date, to_date))
    |> Enum.map(&booking_to_string(&1))
  end

  defp filter_date(%Booking{data_completa: data_completa}, from_date, to_date) do
    NaiveDateTime.compare(from_date, data_completa) == NaiveDateTime.compare(data_completa, to_date)
  end

  defp booking_to_string(%Booking{
    data_completa: data_completa,
    cidade_origem: cidade_origem,
    cidade_destino: cidade_destino,
    id_usuario: id_usuario
  })
  do
    "#{id_usuario},#{cidade_origem},#{cidade_destino},#{data_completa}\n"
  end
end
