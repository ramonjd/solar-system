#!/usr/bin/ruby

BASE_VALUES = {
  #Astronomical unit (AU) = average distance between Earth and the Sun 
  :au_km => 1.496 * (10**8),
  # radius of the Earth
  :radius_earth => 6371,
  # mass of Earth
  :mass_earth => 5.97219 * (10**24),
  # period of Earth (years it takes to orbit the Sun)
  :period_earth => 1
}

PLANETS = { 
  :sun => {
    :name => "The Sun",
    :mass_e => 333000,
    :radius_e => 109,
    :period_e => 0,
    :semi_major_axis_au => 0
  },     
  :mercury => {
    :name => "Mercury",
    :mass_e => 0.055,
    :radius_e => 0.3829,
    :period_e => 0.240846,
    :semi_major_axis_au => 0.387098
  },    
  :venus => {
    :name => "Venus",
    :mass_e => 0.815,
    :radius_e => 0.9499,
    :period_e => 0.6156,
    :semi_major_axis_au => 0.723327
  },    
  :mars => {
    :name => "Mars",
    :mass_e => 0.107,
    :radius_e => 0.533,
    :period_e => 2.1369,
    :semi_major_axis_au => 1.523679
  },    
  :jupiter => {
    :name => "Jupiter",
    :mass_e => 317.8,
    :radius_e => 11.209,
    :period_e => 11.8618,
    :semi_major_axis_au => 5.204267
  }
}


class SolarSystem


end


class HeavenlyBodies


end






class Options
  
  def initialize(opts)
    @opts = opts
  end
  
  public
  
  def print_options
    str = ''
    @opts.each_with_index do |opt, index| 
      str << (index + 1).to_s + ") #{opt['title']}\n"
    end
    str
  end
  
  public

  def get_selected_value(index)
    @opts[index - 1]["title"]
  end

  public
  
  def get_selected_key(index)
    @opts[index - 1]["name"]
  end

  private
  
  def get_option_value(key)
    
  end  

end


def calculate_force(weight, planet_obj)
  (weight * (planet_obj[:mass_e]/(planet_obj[:radius_e])**2).round(2))
end

def init
  
  print "How much do you weigh (in kilos)?\n"

  your_weight = Integer(gets.chomp) 

  print "\nUsing weight #{your_weight}kg\n\n" 
  
  planets_list = Options.new(PLANETS.map { |k, v| {"name" => k, "title" => v[:name]} })

  print "Now select a planet: \n" << planets_list.print_options()
  
  planet_key = Integer(gets.chomp)
  
  your_planet = planets_list.get_selected_value(planet_key)
  
  print "\nUsing weight #{your_weight}kg on #{your_planet} \n\n"
  
  your_weight_on_planet = calculate_force(your_weight, PLANETS[planets_list.get_selected_key(planet_key)])
  
  print "Your weight on #{your_planet} is approx. #{your_weight_on_planet}kg \n\n -----------------------------\n"
  
end

init()



    
    

