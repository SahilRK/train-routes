require 'spec_helper'

describe Route do

  before :each do
    @route = Route.new("AB60", "BC10  ", "CD8", "DC8", "DE6", "AD5", "CE2", "EB3", "AE7")
  end

  describe "Route#calc_distance_btw_towns" do
    it "takes multiple parameters and returns a Route object" do
      @route.should be_an_instance_of Route
    end
  end
end
