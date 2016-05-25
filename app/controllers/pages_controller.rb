class PagesController < ApplicationController
  def hellobi
    authorize! :view, :hellobi
  end
end
