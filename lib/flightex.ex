defmodule Flightex do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Create, as: CreateBooking
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.Create, as: CreateUser

  def start_agents do
    BookingAgent.start_link()
    UserAgent.start_link()
  end

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate create_booking(user_id, params), to: CreateBooking, as: :call
  defdelegate get_booking(booking_id), to: BookingAgent, as: :get
  defdelegate get_user(user_id), to: UserAgent, as: :get
end
