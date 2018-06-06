module Traffic
  class State
    def to_s
      name
    end

    def name
      self.class.name.split('::').last.downcase
    end

    def signal(traffic_light)
      traffic_light.turning_on_lamp(color.to_sym)
    end
  end

  class Stop < State
    def color
      'red'
    end

    def next_state
      Proceed.new
    end
  end

  class Proceed < State
    def color
      'green'
    end

    def next_state
      Warning.new
    end
  end

  class Warning < State
    def color
      'yellow'
    end

    def next_state
      Stop.new
    end

    def signal(traffic_light)
      super
      traffic_light.ring_warning_bell
    end
  end
end