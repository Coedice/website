---
---
window.filter = (searchTag) ->
	# Filter by tag
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