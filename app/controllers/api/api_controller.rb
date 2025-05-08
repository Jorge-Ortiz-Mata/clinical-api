module Api
  class ApiController < ApplicationController
    before_action :json_format

    private

    def json_format
      request.format = :json
    end
  end
end
