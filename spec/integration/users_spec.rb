require 'swagger_helper'

describe 'Medical Cannabis Users API' do
  path '/api/v1/users' do
    post 'Creates a new user' do
      tags 'users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :data, in: :body, schema: {
        '$ref' => '#/definitions/createUser'
      }

      response '201', 'user created' do
        let(:data) { { name: 'foo', dob: 'bar', email: 'barbie' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:data) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/users' do
    get 'Retrieves all users' do
      tags 'users'
      produces 'application/json'

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 '$ref' => '#/definitions/createUser'
               }
        let(:user) { User.create(name: 'foo', dob: 'bar', email: 'barbie').id }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    get 'Retrieves a user' do
      tags 'users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 '$ref' => '#/definitions/createUser'
               }
        let(:user) { { name: 'foo', dob: 'bar', email: 'barbie' } }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    put 'Update a user' do
      tags 'users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true
      parameter name: :data, in: :body, schema: {
        '$ref' => '#/definitions/createUser'
      }
      let(:user_1) do
        create(:user)
      end

      response '200', 'user updated' do
        let(:user) { { name: 'foo', dob: 'bar', email: 'barbie' } }
        run_test!
      end

      response '404', 'user not found' do
        let(:user) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    delete 'Delete a user' do
      tags 'users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      let(:user_1) do
        create(:user)
      end

      response '204', 'user deleted' do
        let(:user) { create(:user).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:user) { 'invalid' }
        run_test!
      end
    end
  end
end
