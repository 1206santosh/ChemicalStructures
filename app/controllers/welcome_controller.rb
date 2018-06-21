class WelcomeController < ApplicationController
  def get_marvin
      # if params[:ref_id].present?
      #    ref_id=params[:ref_id]
      #    @marvin_structure=Marvinstructure.find_by(uid:ref_id)
      #    gon.marvin_structure=@marvin_structure.structure
      # else
      #   @marvin_structure=Marvinstructure.new
      # end
  end

  def save_marvin
     if params[:marvin][:ref_id].present?
       marvin_structure=Marvinstructure.find_by(uid:params[:marvin][:ref_id])
       marvin_structure.update(structure:params[:marvin][:structure],marvinbs64:params[:marvin][:marvinbs64])
     else

       puts "++++++++++++++++++++++++++++"
       puts params[:marvin].keys
       puts "++++++++++++++++++++++++++++"
       marvin=params.require(:marvin).permit(:structure,:marvinbs64)
       marvin_structure=Marvinstructure.create!(marvin)
     end
      render json:{success:true,ref_id:marvin_structure.uid}
  end

  def index

  end
end
