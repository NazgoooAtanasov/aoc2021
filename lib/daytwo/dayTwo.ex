defmodule DayTwo do
  def dayTwo do
    {:ok, file} = File.read("lib/daytwo/input.txt")

    parsed = file
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn [dir, step] -> 
        case dir do
          "up" -> [dir, -String.to_integer(step)]
          _ -> [dir, String.to_integer(step)]
        end
      end)

    depth = parsed
    |> Enum.filter(fn [dir, _step] -> dir == "up" or dir == "down" end)
    |> Enum.map(fn [_dir, step] -> step end)
    |> Enum.sum()

    horz = parsed
    |> Enum.filter(fn [dir, _step] -> dir == "forward" end)
    |> Enum.map(fn [_dir, step] -> step end)
    |> Enum.sum()

    horz * depth
  end

  def dayTwoPratTwo do
    {:ok, file} = File.read("lib/daytwo/input.txt")

    result = file
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn [dir, step] -> 
        case dir do
          "up" -> [dir, -String.to_integer(step)]
          _ -> [dir, String.to_integer(step)]
        end
      end)
    |> Enum.reduce(%{:horz => 0, :depth => 0, :aim => 0},
      fn [dir, step],
      %{:horz => horz, :depth => depth, :aim => aim} -> 
        case dir do
          "forward" -> 
            if aim == 0 do
              %{
                :horz => horz + step,
                :depth => depth,
                :aim => aim
              }
            else
              %{
                :horz => horz + step,
                :depth => depth + (aim * step),
                :aim => aim
              }
            end
          _ -> 
            %{
              :horz => horz,
              :depth => depth,
              :aim => aim + step
            }
        end
      end)
  
    result[:horz] * result[:depth]
  end
end
