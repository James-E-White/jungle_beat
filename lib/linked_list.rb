require 'pry'
require './lib/node'

class LinkedList
  attr_reader :head,
              :data

  def initialize; end

  def append(sound)
    return unless @head.nil?

    @head = Node.new(sound)
  end

  def count
    return 0 if @head.nil?

    1
  end

  def to_string
    head.data
  end
end
