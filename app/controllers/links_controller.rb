class LinksController < ApplicationController
  respond_to :json

  def index

    # Gather all post data
    links = Link.find(:all, :limit => 10, :order => "shares DESC")

    # Respond to request with post data in json format
    respond_with(links) do |format|
      format.json { render :json => links.as_json }
    end

  end

end
