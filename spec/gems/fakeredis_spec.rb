require 'rails_helper'

describe 'with fakeredis gem loaded' do
  it { expect { Rails.cache.delete_matched('foo*') }.not_to raise_error }
end
