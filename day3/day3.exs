defmodule Day3 do
  def parse_binary(ls) do
    Enum.join(ls)
    |> String.to_integer(2)
  end

  def run() do
    input = Part1.parse_input()
    parse_max = fn ls -> parse_rate(ls, &Enum.max_by/2, "1") end
    parse_min = fn ls -> parse_rate(ls, &Enum.min_by/2, "0") end

    # gamma =
    #   Enum.map(input, parse_max)
    #   |> Enum.join()
    #   |> String.to_integer(2)

    # epsilon =
    #   Enum.map(input, parse_min)
    #   |> Enum.join()
    #   |> String.to_integer(2)

    # IO.puts("gamma: #{gamma}  epsilon: #{epsilon}")
    # IO.puts("gamma * epsilon = #{gamma * epsilon}")

    oxygen =
      Part2.parse_rows()
      |> Part2.loop(0, parse_max)
      |> parse_binary()

    co2 =
      Part2.parse_rows()
      |> Part2.loop(0, parse_min)
      |> parse_binary()

    IO.puts("oxygen: #{oxygen}  co2: #{co2}")
    IO.puts("oxygen * co2 = #{oxygen * co2}")
  end

  def parse_rate(ls, fun, default) do
    frequencies = Enum.frequencies(ls)

    if frequencies["0"] == frequencies["1"] do
      default
    else
      fun.(frequencies, &elem(&1, 1))
      |> elem(0)
    end
  end
end

defmodule Part2 do
  def loop(lists, _i, _fun) when length(lists) == 1 do
    IO.puts("one left! its this: ")
    IO.inspect(lists)
  end

  def loop(lists, i, fun) do
    ith_digits = Enum.map(lists, fn x -> Enum.at(x, i) end)
    desired_digit = fun.(ith_digits)
    filtered_lists = Enum.filter(lists, fn list -> Enum.at(list, i) == desired_digit end)
    loop(filtered_lists, i + 1, fun)
  end

  def parse_rows() do
    File.read!("input.txt")
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
  end
end

defmodule Part1 do
  def parse_input() do
    File.read!("input.txt")
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end

Day3.run()
