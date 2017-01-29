defmodule Underscore do
  @moduledoc """
  Documentation for Underscore.
  """

  @doc """
  Returns the first element of a list.

  ## Examples
      iex> Underscore.first [1, 2, 3, 4]
      1
  """
  def first([hd | _tail]) do
    hd
  end

  @doc """
  Returns a list containing the first n elements of a list.

  ## Examples
      iex> Underscore.first [1, 2, 3, 4], 2
      [1, 2]
  """
  def first(lst, n) do
    Enum.take lst, n
  end

  @doc """
  Returns the last element of a list.

  ## Examples
      iex> Underscore.last [1, 2, 3, 4]
      4
  """
  def last(lst) do
    hd Enum.reverse lst
  end

  @doc """
  Returns a list containing the last n elements of a list.

  ## Examples
      iex> Underscore.last [1, 2, 3, 4], 2
      [3, 4]
  """
  def last(lst, n) do
    reversed = Enum.reverse(lst)
    reversed
    |> Enum.take(n)
    |> Enum.reverse
  end

  @doc """
  Calls iterator(value, key, collection) for each element of collection.
  """
  def each(collection, iterator) do
    Enum.each collection, iterator
  end

  @doc """
  Returns the index at which value can be found in the list
  or -1 if value is not present in the list.

  ## Examples
      iex> Underscore.indexOf [1, 2, 3, 4], 1
      0

      iex> Underscore.indexOf [1, 2, 3, 4], 5
      -1
  """
  def indexOf(collection, elem) do
    helperIndexOf(collection, elem, 0)
  end

  @doc false
  def helperIndexOf([], _elem, _counter), do: -1
  def helperIndexOf([elem | _tail], elem, counter), do: counter
  def helperIndexOf([_ | tail], elem, counter), do: helperIndexOf(tail, elem, counter + 1)

  @doc """
  Returns all elements of an list that pass a truth test.

  ## Examples
      iex> Underscore.filter [1, 2, 3, 4, 5], &(rem(&1, 2) != 0)
      [1, 3, 5]
  """
  def filter(collection, test) do
    Enum.filter(collection, test)
  end

  @doc """
  Produces a duplicate-free version of the list.

  ## Examples
      iex> Underscore.uniq [1, 2, 3, 4, 2, 5, 1]
      [1, 2, 3, 4, 5]
  """
  def uniq(collection), do: Enum.uniq collection

  @doc """
  Takes a list of maps and returns a list of the values of
  a certain property in them. E.g. take an list of people and return
  a list of just their ages.

  ## Examples
      iex> Underscore.pluck [%{name: "Gabriel", age: 39}, %{name: "Luis", age: 46}], :age
      [39, 46]

      iex> Underscore.pluck [%{"name" => "Gabriel", "age" => 39}, %{"name" => "Luis", "age" => 46}], "age"
      [39, 46]
  """
  def pluck(collection, property) do
    Enum.map collection, fn %{^property => value} -> value end
  end

  @doc """
  Determines if a list or map contains a given value.

  ## Examples
      iex> Underscore.contains([1, 2, 3, 4], 1)
      true

      iex> Underscore.contains([1, 2, 3, 4], 5)
      false

      iex> Underscore.contains(%{a: 1, b: 2}, 1)
      true

      iex> Underscore.contains(%{a: 1, b: 2}, 0)
      false
  """
  def contains([], _value), do: false
  def contains([_hd | _tl] = lst, value) do
    result = Enum.find(lst, &(&1 == value))
    if result == nil do false else true end
  end
  def contains(mp, value) do
    contains(Map.values(mp), value)
  end
end
