require 'swagger_helper'

describe 'Medical Cannabis Users API' do

  path '/users' do

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          dob: { type: :string },
          email: { type: :string },
          ident_num: { type: :string },
          ident_state: { type: :string },
          ident_expir: { type: :string },
          ident_img: { type: :string },
          recom_num: { type: :string },
          recom_issuer: { type: :string },
          recom_expir: { type: :string },
          recom_img: { type: :string },
        },
        required: [ 'name', 'dob', 'email']
      }

      response '201', 'user created' do
        let(:user) { { name: 'foo', dob: 'bar', email: 'barbie' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'foo' } }
        run_test! 
      end
    end
  end

  path '/users/{id}' do
    get 'Retrieves a blog' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object,
        properties: {
          name: { type: :string },
          dob: { type: :string },
          email: { type: :string },
          ident_num: { type: :string },
          ident_state: { type: :string },
          ident_expir: { type: :string },
          ident_img: { type: :string },
          recom_num: { type: :string },
          recom_issuer: { type: :string },
          recom_expir: { type: :string },
          recom_img: { type: :string },
        },
        required: [ 'name', 'dob', 'email']

        let(:id) { User.create(name: 'foo', dob: 'bar', email: 'barbie').id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end 
    end
  end

end
