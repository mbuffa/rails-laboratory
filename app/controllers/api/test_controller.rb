class Api::TestController < ApplicationController
  def hello_world
    # return render json: {}, status: 403
    return render json: { message: 'Hello from Rails!' }
  end
end
