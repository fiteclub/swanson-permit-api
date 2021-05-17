# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      definitions: {
        createUser: {
          type: :object,
          properties: {
            name: { type: :string, example: 'Leslie Knope' },
            dob: { type: :string, example: '1975-1-1' },
            email: { type: :string, example: 'lilsebastian1975@lycos.com' },
            ident_num: { type: :string, example: 'S1128628' },
            ident_state: { type: :string, example: 'IN' },
            ident_expir: { type: :string, example: '2025-1-1' },
            ident_img: { type: :string, example: 'image.jpg' },
            recom_num: { type: :string, example: '32823493' },
            recom_issuer: { type: :string, example: 'Dr. Ron Burgundy' },
            recom_expir: { type: :string, example: '2023-1-1' },
            recom_img: { type: :string, example: 'image.jpg' }
          },
          required: %i[name email dob]
        },
        showUser: {
          type: :object,
          properties: {
            id: { type: :number, example: 1 },
            name: { type: :string, example: 'Leslie Knope' },
            dob: { type: :string, example: '1975-1-1' },
            email: { type: :string, example: 'lilsebastian1975@lycos.com' },
            ident_num: { type: :string, example: 'S1128628' },
            ident_state: { type: :string, example: 'IN' },
            ident_expir: { type: :string, example: '2025-1-1' },
            ident_img: { type: :string, example: 'image.jpg' },
            recom_num: { type: :string, example: '32823493' },
            recom_issuer: { type: :string, example: 'Dr. Ron Burgundy' },
            recom_expir: { type: :string, example: '2020-1-1' },
            recom_img: { type: :string, example: 'image.jpg' },
            status: { type: :string, example: 'EXPIRED'}
          },
          required: %i[name email dob]
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
