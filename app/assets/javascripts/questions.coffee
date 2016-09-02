ready = ->
	$(document).on 'click', ".option", -> 
		
		answer = $(this).data("answer")
		$("#answer_content").val(answer)
		$(".option-show").addClass("option-hide").removeClass("option-show")
		$(this).children(".option-checked").removeClass("option-hide").addClass("option-show")

		$(".bd-active").addClass("bd-not-active").removeClass("bd-active")
		$(this).parent(".bd").removeClass("bd-not-active").addClass("bd-active")

		$(".btn-submit").prop('disabled', false)

$(document).ready(ready)
$(document).on('page:load', ready)