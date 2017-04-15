# frozen_string_literal: true

class ArticlesController < ApplicationController
  resource :article

  api :GET, 'articles', 'List all articles'
  def index
    respond_with @articles
  end

  api :GET, 'articles/:id', 'View a single article'
  param :id, :number, required: true
  def show
    respond_with @article
  end
end
