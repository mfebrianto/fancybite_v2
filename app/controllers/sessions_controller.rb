class SessionsController < Devise::SessionsController
  def create
    p '>>>>override'
    super
  end
end