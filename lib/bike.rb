class Bike

  attr_reader :broken

  def initialize(broken=false)
    @broken = broken
  end

  def report_broken
    @broken = true
  end

  def working?
    true
  end

end
