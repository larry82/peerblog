ready = ->
	$(document).on 'click', ".bd", -> 
		# 
		$(this).parent(".options").parent(".question-block").removeClass("undone")
		$(this).parent(".options").parent(".question-block").removeClass("undone-highlight")


		$(this).siblings(".bd").children(".option").children(".option-show").addClass("option-hide").removeClass("option-show")
		$(this).children(".option").children(".option-checked").removeClass("option-hide").addClass("option-show")

		$(this).addClass("bd-active").removeClass("bd-not-active")
		$(this).siblings(".bd-active").removeClass("bd-active").addClass("bd-not-active")


		link 			= $(this).children(".option").data("link")
		score 			= $(this).children(".option").data("score")
		question_id 	= $(this).children(".option").data("question-id")
		quiz_result_id  = $(this).children(".option").data("quiz-result-id")

		$.ajax
			url: link
			type: 'POST'
			data: {score:score,link:link,question_id:question_id,quiz_result_id:quiz_result_id}
			success: ->
				console.log("ajax dones")

	$(document).on 'click', "#send-btn-disabled", -> 
		$(".undone").children(".title").children("h2").addClass("undone-highlight")
		$(".undone").children(".title").children("h2").children(".undone-text").html("未填 ")
		undone = $(".undone")[0]
		undone.scrollIntoView(block: "start", behavior: "smooth")


$(document).ready(ready)
$(document).on('page:load', ready)
		

