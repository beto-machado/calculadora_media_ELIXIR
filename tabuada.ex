defmodule Tabuada do
  def imprimir_tabuada(numero) do
    for i <- 1..10 do
      resultado = numero * i
      IO.puts("#{numero} x #{i} = #{resultado}")
    end
  end
end

Tabuada.imprimir_tabuada(2)
