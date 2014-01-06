require 'spec_helper'

describe Board do
  it { should validate_presence_of :grid }
  it { should serialize(:grid) }
  it { should belong_to :game }
end
