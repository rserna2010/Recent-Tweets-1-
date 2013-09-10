$(document).ready(function() {
		$("#spinner").load(function(){
			var username = $("#spinner").data("name");

			$.ajax({
				url: '/' + username,
				method: "get"
			}).done(function(data){
				console.log(data)
				$('ul').html(data)
			})


		})
});
