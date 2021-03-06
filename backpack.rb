class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    basic_clothing_items
    # Ensure appropriate clothing is added to backpack depending on weather
    if weather == 'rainy'
      rainy_weather_items
    elsif weather == 'cold'
      cold_weather_items
    else
    end

    gym_day?(day_of_week)
    weekend?(day_of_week)
  end

  def weather
    @attributes[:weather]
  end

  def day_of_week
    @attributes[:day_of_week]
  end
    # Ensure gym shoes are added to backpack if it's a gym day
    # Gotta get to the gym on Mondays and Thursdays.
    def gym_day?(day_of_week)
      if day_of_week == 'monday' || day_of_week == 'thursday'
        @items << 'gym shoes'
      end
    end

    # Bring a packed lunch on all weekdays, and snacks on weekends
    def weekend?(day_of_week)
      if day_of_week != 'saturday' && day_of_week != 'sunday'
        @items << 'packed lunch'
      else
        @items << 'snacks'
      end
    end


  def basic_clothing_items
    @items << 'pants'
    @items << 'shirt'
  end

  def cold_weather_items
      @items << 'jacket'
  end

  def rainy_weather_items
    @items << 'umbrella'
  end

  # Prints a summary packing list for Melinda's backpack
  def print_summary_of_packing_list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{day_of_week}, Weather: #{weather}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end
end

melindas = Backpack.new(day_of_week: 'thursday', weather: 'rainy')
puts melindas.print_summary_of_packing_list
