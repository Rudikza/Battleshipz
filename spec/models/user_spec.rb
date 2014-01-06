require 'spec_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should have_many :games }
end
