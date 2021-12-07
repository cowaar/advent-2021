defmodule Day3 do
  def run() do
    input = parse_input()
    parse_gamma = fn ls -> parse_rate(ls, &Enum.max_by/2) end
    parse_epsilon = fn ls -> parse_rate(ls, &Enum.min_by/2) end

    gamma =
      Enum.map(input, parse_gamma)
      |> Enum.join()
      |> String.to_integer(2)

    epsilon =
      Enum.map(input, parse_epsilon)
      |> Enum.join()
      |> String.to_integer(2)

    IO.puts("gamma: #{gamma}  epsilon: #{epsilon}")
    IO.puts("gamma * epsilon = #{gamma * epsilon}")
  end

  def parse_rate(ls, fun) do
    Enum.frequencies(ls)
    |> fun.(&elem(&1, 1))
    |> elem(0)
  end

  defp parse_input() do
    File.read!("input.txt")
    |> String.split("\r\n", trim: true)
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end
end

Day3.run()
