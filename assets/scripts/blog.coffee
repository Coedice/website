---
---
window.blogTagFilter = (searchTag) -> # Filter by tag
	postSummaries = document.getElementsByClassName("postSummary")

	for postSummary in postSummaries
		postTags = postSummary.getElementsByClassName("tagLabel")
		tagMatches = false

		for postTag in postTags
			if searchTag in postTag.classList || searchTag == "none"
				tagMatches = true
				break

		postSummary.style.display = if tagMatches then "block" else "none"

	# Colour tag labels' borders
	filterTagsList = document.getElementsByClassName("tagLabel");

	for filterTagLabel in filterTagsList
		filterTagLabel.style.border = "transparent solid 1px"

		if searchTag in filterTagLabel.classList
			filterTagLabel.style.border = "white solid 1px"


postDateRelativeTimeMessage = (postDate) ->
	daysDifference = parseInt(((new Date()).getTime() - postDate.getTime())/(1000*60*60*24))
	message = ""

	if daysDifference == 0
		message = "posted today"
	else if daysDifference < 7
		message = "#{daysDifference} days ago"
	else if daysDifference < 31
		message = "#{daysDifference//7} weeks ago"
	else if daysDifference < 365
		message = "#{daysDifference//30.417} months ago"
	else
		message = "#{daysDifference//365.24} years ago"

	return message


window.onload = () ->
	document.getElementById("tagFilterList").style.display = "inline-block" # Display tag list for JS-enabled users

	for timeDifferenceSpan in document.getElementsByClassName("relativePostTime")
		postDate = new Date(timeDifferenceSpan.innerText)
		timeDifferenceSpan.innerText = ", #{postDateRelativeTimeMessage(postDate)}"
		timeDifferenceSpan.style.display = "inline" # Display time difference for JS-enabled users
