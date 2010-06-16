class WikisController < ResourceController::Base
  before_filter :login_required
end
