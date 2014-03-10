class CareGroupsController < ApplicationController
  before_action :set_care_group, only: [:show, :edit, :update, :destroy, :manage]

  # GET /care_groups
  # GET /care_groups.json
  def index
    @care_groups = CareGroup.all
  end

  # GET /care_groups/1
  # GET /care_groups/1.json
  def show
  end

  # GET /care_groups/new
  def new
    @care_group = CareGroup.new
  end

  # GET /care_groups/1/edit
  def edit
  end

  def manage
    @patients = CareGroup.find(params[:id]).patients
  end

  # POST /care_groups
  # POST /care_groups.json
  def create
    @care_group = CareGroup.new(care_group_params)

    respond_to do |format|
      if @care_group.save
        format.html { redirect_to @care_group, notice: 'Care group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @care_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @care_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /care_groups/1
  # PATCH/PUT /care_groups/1.json
  def update
    respond_to do |format|
      if @care_group.update(care_group_params)
        format.html { redirect_to @care_group, notice: 'Care group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @care_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /care_groups/1
  # DELETE /care_groups/1.json
  def destroy
    @care_group.destroy
    respond_to do |format|
      format.html { redirect_to care_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_care_group
      @care_group = CareGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def care_group_params
      params.require(:care_group).permit(:name)
    end
end
