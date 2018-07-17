class V1::ContactsController < ApplicationController
	def index
		@contacts = Contact.order("contacts.id ASC")
		# @contacts =  Contact.all
		render json: @contacts, status: :ok
	end

	def show
		@contacts = Contact.find(params[:id])
		render json: @contacts, status: :ok
	end

	def create
		@contacts = Contact.new(contact_params)
		if @contacts.save
			render json: @contacts, status: :created
		else
			render json: @contacts.errors, status: :errors 
		end
	end

	def destroy
		@contacts = Contact.where(id: params[:id]).first
		if @contacts.destroy
			head(:OK)
		else
			head(:unprocessable_entity)
		end
	end

	def update
		@contacts = Contact.find(params[:id])
		if @contacts.update(contact_params)
			render json: @contacts, status: :update
		else
			render json: @contacts.errors, status: :errors 
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :email)
	end
end
