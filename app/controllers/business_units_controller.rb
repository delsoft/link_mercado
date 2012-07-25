class BusinessUnitsController < ApplicationController
  
  skip_before_filter :authenticate
  
  # GET /business_units
  # GET /business_units.json
  def index
    @business_units = BusinessUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_units }
    end
  end

  # GET /business_units/1
  # GET /business_units/1.json
  def show
    @business_unit = BusinessUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_unit }
    end
  end

  # GET /business_units/new
  # GET /business_units/new.json
  def new
    @business_unit = BusinessUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_unit }
    end
  end

  # GET /business_units/1/edit
  def edit
    @business_unit = BusinessUnit.find(params[:id])
  end

  # POST /business_units
  # POST /business_units.json
  def create
    @business_unit = BusinessUnit.new(params[:business_unit])

    respond_to do |format|
      if @business_unit.save
        format.html { redirect_to @business_unit, notice: 'Business unit was successfully created.' }
        format.json { render json: @business_unit, status: :created, location: @business_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @business_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_units/1
  # PUT /business_units/1.json
  def update
    @business_unit = BusinessUnit.find(params[:id])

    respond_to do |format|
      if @business_unit.update_attributes(params[:business_unit])
        format.html { redirect_to @business_unit, notice: 'Business unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_units/1
  # DELETE /business_units/1.json
  def destroy
    @business_unit = BusinessUnit.find(params[:id])
    @business_unit.destroy

    respond_to do |format|
      format.html { redirect_to business_units_url }
      format.json { head :no_content }
    end
  end
end
