class InvitesController < ApplicationController

	# Use this method to store parameters in a session
	# You can then extract the values on callback
	def begin
    session[:custom_parameter] = param[:custom_parameter]
    redirect_to "/contacts/#{params[:provider]}"
	end

	def index
		# Do something with the created session value
		# Then, delete it from the session hash
		session.delete(:custom_parameter)

		# Now, gather your contacts to be displayed on the page
		@contacts = request.env['omnicontacts.contacts']
		respond_to do |format|
			format.html 
		end
	end

end
