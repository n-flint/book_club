require 'rails_helper'

describe User, type: :model do

  describe "relationships" do
    it {should have_many(:reviews)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "class methods" do
  end

  describe "instance methods" do
  end
end
