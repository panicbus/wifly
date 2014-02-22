$(function(){
	ajax();
}) 

function ajax(){
	$('body').on('click', '#submit_button', function(event){	
		event.preventDefault();

		// creates a hash called 'checkin' with name, comment and location_id 
		// for the ajax call that the controller can parse
		var checkin = {
			checkin:
			{
				name: $('#name').val(),
				comment: $('#comment').val(),
				location_id: $('#location_id').val()
			}
		};

	

	}) // ends submit button on click
} // ends ajax function
