require 'swagger_helper'

RSpec.describe 'api/v1/doctors', type: :request do
  path '/api/v1/doctors' do
    get('list doctors') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
    post('create doctor') do
      response(200, 'successful') do
        consumes 'appication/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: { name: { type: :string }, speciality: { type: :string }, avatar: { type: :string },
                        description: { type: :string }, bill: { type: :integer }, email: { type: :string },
                        location: { type: :string } },
          required: %w[name speciality image description bill email location]
        }
        let(:doctor) { { name: 'doctor' } }
        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end
end
