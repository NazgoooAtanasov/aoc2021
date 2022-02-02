defmodule APP do
  def dayOne do
    {:ok, file} = File.read("lib/dayone/input.txt")

    file
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [first, second] -> first < second end)
  end

  def dayOnePartTwo do
    {:ok, file} = File.read("lib/dayone/input.txt")

    file
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [first, second] -> first < second end)
  end
end
