module GrapeApp
  class V1::User < Grape::API
    helpers do
      params :token do
        optional :token, type: String, default: nil,
        documentation: {
          type: 'String',
          desc: 'Authenticate token'
        }
      end

      params :attributes do
        optional :attributes, type: Hash, default: {},
        documentation: {
          type: 'Hash',
          desc: 'Params attributes of product'
        }
      end
    end

    resource :users do
        params do
          use :token, type: String, desc: 'Authentication token'
        end

        desc 'Retrieve all public questions asked by user with their answers'
        resource :questions_and_answers do
          get do
            begin
              authenticate!
              tenant = ::Tenant.where(access_token: params[:token]).first
              output = User.user_questions_answers(tenant.user_id)
              api_response(output.to_json)
            rescue ActiveRecord::RecordNotFound
              status 404 # Not found
            end
          end
        end
    end
  end
end
