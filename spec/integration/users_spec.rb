require 'swagger_helper'

describe 'Medical Cannabis Users API' do
  path '/api/v1/users' do
    post 'Creates a new user' do
      tags 'users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        '$ref' => '#/definitions/createUser'
      }

      response '201', 'user created' do
        let(:user) { create(:user) }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/users' do
    get 'Retrieves all users' do
      tags 'users'
      response '200', 'list users' do
        consumes 'application/json'
        produces 'application/json'
        schema type: :array, items: { '$ref' => '#/definitions/showUser' }
        let(:user) { create(:user) }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}' do
    get 'Retrieves a user' do
      tags 'users'
      response '200', 'user found' do
        consumes 'application/json'
        parameter name: :user_id, in: :path, type: :string
        produces 'application/json'
        schema type: :object, properties: {
          '$ref' => '#/definitions/showUser'
        }
        let(:user) { create(:user) }
        run_test!
      end

      response '404', 'user not found' do
        let(:Response) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}' do
    put 'Update a user' do
      tags 'users'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        '$ref' => '#/definitions/createUser'
      }

      response '200', 'user updated' do
        let(:user) { create(:user) }
        run_test!
      end

      response '404', 'user not found' do
        let(:user) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}' do
    delete 'Delete a user' do
      tags 'users'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      produces 'application/json'

      let(:user) do
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
