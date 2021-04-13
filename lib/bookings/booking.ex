defmodule Flightex.Bookings.Booking do
  @keys [:id, :data_completa, :cidade_origem, :cidade_destino, :id_usuario]
  @enforce_keys @keys

  defstruct @keys

  def build(data_completa, cidade_origem, cidade_destino, id_usuario) do
    Flightex.get_user(id_usuario)
    |> create_user(data_completa, cidade_origem, cidade_destino, id_usuario)
  end

  defp create_user({:ok, _}, data_completa, cidade_origem, cidade_destino, id_usuario) do
    id = UUID.uuid4()

    {:ok,
     %__MODULE__{
       id: id,
       data_completa: data_completa,
       cidade_origem: cidade_origem,
       cidade_destino: cidade_destino,
       id_usuario: id_usuario
     }}
  end

  defp create_user({:error, _} = error, _data, _origem, _destino, _usuario), do: error
end
