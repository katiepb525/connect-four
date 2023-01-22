# frozen_string_literal: true

module Symbols
  def umbrella
    umbrella = "\u2602"
    umbrella.encode('utf-8')
  end

  def empty_circle
    empty_circle = "\u25cb"
    empty_circle.encode('utf-8')
  end

  def heart
    heart = "\u2764"
    heart.encode('utf-8')
  end

  def star
    star = "\u2605"
    star.encode('utf-8')
  end

  def cloud
    cloud = "\u2601"
    cloud.encode('utf-8')
  end
end
