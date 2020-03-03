require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :percent_off }
    it { should validate_presence_of :bulk_minimum }
  end

  describe 'relationships' do
  	it { should belong_to :merchant }
  end
end
