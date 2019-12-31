class PeopleController < ApplicationController

	# GET /people
	def index
		@search_text = params[:search_text]

		@people = []
		if !@search_text.blank?
			@people = Person.all
                          .where("lower(first_name) like ? or lower(last_name) like ?", "%#{@search_text.downcase}%", "%#{@search_text.downcase}%")
                          .limit(100)
		end
	end

	private

	# Use callbacks to share common setup or constraints between actions.
	def set_person
		@person = Person.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def person_params
		params.require(:person).permit(:first_name, :last_name, :email, :age, :moto, :address, :city, :state, :zip)
	end
end
