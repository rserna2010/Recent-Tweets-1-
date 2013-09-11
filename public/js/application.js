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
		});

		$("#real_tweet").on('submit', function(e){
			e.preventDefault();
			$("#waiting").text("Pending");
			$("#real_tweet").toggle()
			
			$.ajax({
				url: "/realtweet",
				method: "post",
				data: $(this).serialize()
			}).done(function(server_data){
				$("#waiting").text("Tweet has posted")
				$("#real_tweet").toggle()
				$("#value_space").val('');
		});
	});
});

		

