class CompaniesController < ApplicationController
  before_filter :login_required
  
  def index
    @companies = Company.all
  end
  
  def new
    @company = Company.new
  end

  def create
    @company  = Company.new(params[:company])
    if @company.save
      redirect_to companies_path
    else
      render :new
    end
  end
end
