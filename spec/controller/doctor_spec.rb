require 'swagger_helper'

describe 'Doctors API' do
  path '/v1/doctors' do
    get 'Get all doctors' do
      tags 'Doctors'
      produces 'application/json'
      response '200', 'doctors found' do
        run_test!
      end
    end
  end
  path '/v1/doctors' do
    post 'Create a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          specialty: { type: :string }
        },
        required: %w[name specialty]
      }
      response '201', 'doctor created' do
        let(:doctor) { { name: 'Moises', specialty: 'Pediatria' } }
        # run_test!
      end
      response '422', 'invalid request' do
        let(:doctor) { { name: 'Miller' } }
        # run_test!
      end
    end
  end
  path '/v1/doctors/{id}' do
    get 'Get a doctor' do
      tags 'Doctors'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, required: true
      response '200', 'doctor found' do
        let(:id) { create(:doctor).id }
        # run_test!
      end
      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        # run_test!
      end
    end
  end
  path '/v1/doctors/{id}' do
    put 'Update a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, required: true
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          specialty: { type: :string }
        },
        required: %w[name specialty]
      }
      response '201', 'doctor updated' do
        let(:id) { create(:doctor).id }
        let(:doctor) { { name: 'Moises', specialty: 'Pediatria' } }
        # run_test!
      end
      response '422', 'invalid request' do
        let(:id) { create(:doctor).id }
        let(:doctor) { { name: 'Miller' } }
        # run_test!
      end
    end
  end
  path '/v1/doctors/{id}' do
    delete 'Delete a doctor' do
      tags 'Doctors'
      parameter name: :id, in: :path, type: :string, required: true
      response '204', 'doctor deleted' do
        let(:id) { create(:doctor).id }
        # run_test!
      end
    end
  end
end