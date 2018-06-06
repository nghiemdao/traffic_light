require_relative 'traffic'

class TrafficLight
  def change_to(state)
    @state = State(state)
  end

  def next_state
    @state.next_state
  end

  def signal
    @state.signal(self)
  end

  def turning_on_lamp(color)
    puts "Turning on #{color} lamp."
  end

  def ring_warning_bell
    puts "Ring ring ring!"
  end

  private

  def State(state)
    case state
    when Traffic::State then state
    else Traffic.const_get(state.to_s.capitalize).new
    end
  end
end