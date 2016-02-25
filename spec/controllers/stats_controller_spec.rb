require 'rails_helper'

RSpec.describe Admin::StatsController, type: :controller do

	it 'returns a 200 status' do
		visit admin_stats_path
		expect(response.status).to eq(200)
	end

end
