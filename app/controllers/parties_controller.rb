class PartiesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json {
        render json: {
          data: @parties,
          next_page: @parties.last_page? ? nil : parties_url(page: @parties.current_page+1, format: :json),
          prev_page: @parties.first_page? ? nil : parties_url(page: @parties.current_page-1, format: :json)
        }
      }
    end
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    @party = Party.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @party }
    end
  end

  # GET /parties/new
  # GET /parties/new.json
  def new
    @party = Party.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @party }
    end
  end

  # GET /parties/1/edit
  def edit
    @party = current_user.parties.find(params[:id])
    @selected_state = @party.city.state_id
    @selected_city = @party.city.id
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(params[:party])
    @party.user = current_user

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render json: @party, status: :created, location: @party }
      else
        format.html { render action: "new" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parties/1
  # PUT /parties/1.json
  def update
    @party = current_user.parties.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party = current_user.parties.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to parties_url }
      format.json { head :no_content }
    end
  end
end
