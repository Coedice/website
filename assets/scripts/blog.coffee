---
---
window.clearSearchBar = () ->
	searchInput = document.getElementById("searchSection").getElementsByTagName("input")[0]
	searchInput.value = ""
	searchInput.focus()
	blogSearchFilter()


window.blogSearchFilter = () ->
	blogTagFilter("none") # Remove tag filters
	searchPhrase = document.getElementById("searchBar").value
	postSummaries = document.getElementById("blogList").children
	noResultsTag = document.getElementById("noResults")
	foundMatch = false

	# Change search icon between magnifying glass and cross
	searchIcon = document.getElementById("searchSection").getElementsByTagName("img")[0]

	if searchPhrase.length > 0
		searchIcon.src = "/assets/images/search/cross.png"
		searchIcon.setAttribute("onclick","clearSearchBar();");
		searchIcon.style.cursor = "pointer"
	else
		searchIcon.src = "/assets/images/search/search.png"
		searchIcon.setAttribute("onclick","");
		searchIcon.style.cursor = "default"

	# Modify post summaries
	for postSummary in postSummaries
		postTitleTag = postSummary.getElementsByTagName("h3")[0]

		# Hide unmatched blog posts
		postTitle = postTitleTag.innerText
		searchMatched = postTitle.toLowerCase().indexOf(searchPhrase.toLowerCase()) > -1
		foundMatch = foundMatch or searchMatched
		postSummary.style.display = if searchMatched then "block" else "none"

		# Remove any existing highlight spans
		postTitleTag.innerHTML = postTitle

		if searchPhrase.length > 0
			# Add spans around matched text
			postTitleTag.innerHTML = postTitleTag.innerHTML.replace(
				new RegExp(searchPhrase, "gi"),
				_ = (matchedText) ->
					return "<span class=\"searchHighlight\">#{matchedText}</span>"
			)

	# Set no match p tag display
	noResultsTag.style.display = if foundMatch then "none" else "block"

previous_search_tag = null

window.blogTagFilter = (searchTag) ->
	# Deal with unselecting search tag
	if previous_search_tag == searchTag
		searchTag = "none"

	# Find post summaries to include
	postSummaries = document.getElementById("blogList").children

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

	# Setup for next search tag interaction
	previous_search_tag = searchTag


postDateRelativeTimeMessage = (postDate) ->
	daysDifference = parseInt(((new Date()).getTime() - postDate.getTime())/(1000*60*60*24))
	message = ""

	if daysDifference == 0
		message = "posted today"
	else if daysDifference < 7
		message = daysDifference
		message += if daysDifference == 1 then " day ago" else " days ago"
	else if daysDifference < 31
		message = daysDifference//7
		message += if message == 1 then " week ago" else " weeks ago"
	else if daysDifference < 365
		message = daysDifference//30.417
		message += if message == 1 then " month ago" else " months ago"
	else
		message = daysDifference//365.24
		message += if message == 1 then " year ago" else " years ago"

	return message


window.onload = () ->
	document.getElementById("tagFilterList").style.display = "inline-block" # Display tag list for JS-enabled users
	document.getElementById("searchSection").style.display = "block" # Display search section for JS-enabled users

	for timeDifferenceSpan in document.getElementsByClassName("relativePostTime")
		postDate = new Date(timeDifferenceSpan.innerText)
		timeDifferenceSpan.innerText = ", #{postDateRelativeTimeMessage(postDate)}"
		timeDifferenceSpan.style.display = "inline" # Display time difference for JS-enabled users
