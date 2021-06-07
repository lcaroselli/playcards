defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      # one comprehension with 2 collections
      "#{value} of #{suit}"
    end
  end
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {_status, binary} = File.read(filename)
    :erlang.binary_to_term binary
  end
 end
