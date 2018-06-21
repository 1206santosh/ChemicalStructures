class ChemicalStructuresController < ApplicationController
  before_action :set_chemical_structure, only: [:show, :edit, :update, :destroy]

  # GET /chemical_structures
  # GET /chemical_structures.json
  def index
    @chemical_structures = ChemicalStructure.all
  end

  # GET /chemical_structures/1
  # GET /chemical_structures/1.json
  def show
  end

  # GET /chemical_structures/new
  def new
    @chemical_structure = ChemicalStructure.new
  end

  # GET /chemical_structures/1/edit
  def edit
    gon.marvin_structure=@chemical_structure.marvin_structure
    # raise
  end

  # POST /chemical_structures
  # POST /chemical_structures.json
  def create
    @chemical_structure = ChemicalStructure.new(chemical_structure_params)
    respond_to do |format|
      if @chemical_structure.save
        format.html { redirect_to @chemical_structure, notice: 'Chemical structure was successfully created.' }
        format.json { render :show, status: :created, location: @chemical_structure }
      else
        format.html { render :new }
        format.json { render json: @chemical_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chemical_structures/1
  # PATCH/PUT /chemical_structures/1.json
  def update
    respond_to do |format|
      if @chemical_structure.update(chemical_structure_params)
        format.html { redirect_to @chemical_structure, notice: 'Chemical structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @chemical_structure }
      else
        format.html { render :edit }
        format.json { render json: @chemical_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chemical_structures/1
  # DELETE /chemical_structures/1.json
  def destroy
    @chemical_structure.destroy
    respond_to do |format|
      format.html { redirect_to chemical_structures_url, notice: 'Chemical structure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chemical_structure
      @chemical_structure = ChemicalStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chemical_structure_params
      params.require(:chemical_structure).permit(:name, :marvin_structure, :structure_bs64, :ref_id)
    end
end