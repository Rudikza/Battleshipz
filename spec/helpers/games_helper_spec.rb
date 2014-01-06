require 'spec_helper'

describe GamesHelper do
  describe "opponents" do
    it { helper.opponents.should be_a_kind_of(Hash) }
    it { helper.opponents.keys.should =~ ["platform45"] }
    it { helper.opponents.values.should =~ [{"url"=>"http://battle.platform45.com/"}] }
    it { helper.opponents.values.should_not include(nil) }
  end

  describe "ship?" do
    let (:info_with_ship)    { {ship: "ship"} }
    let (:info_without_ship) { {ship: ""    } }

    it "should eql true when there is a ship" do
      helper.ship?(info_with_ship).should eql true
    end

    it "should be false when there is no ship" do
      helper.ship?(info_without_ship).should eql false
    end
  end
end
