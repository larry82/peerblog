next_question_id = <%= raw @next_question_id %>

done = <%= raw @done %>

console.log(done)

next_question_id.scrollIntoView(block: "start", behavior: "smooth")

if done == true
	$("#send-btn").removeClass("hide")
	$("#send-btn-disabled").addClass("hide")
	

