function filter(tag) {
	// Filter by tag
	let postSummaries = document.getElementsByClassName('postSummary');

	for (let postSummary of postSummaries) {
		let childSpans = postSummary.getElementsByTagName('span');
		let found = false;

		for (let span of childSpans) {
			if (span.classList.contains(tag) || tag === "none") {
				console.log(span);
				found = true;
			}
		}

		postSummary.style.display = found ? "block" : "none";
	}

	// Make tag labels bold
	let filterTagsList = document.getElementsByClassName("tagLabel");

	for (let filterTagLabel of filterTagsList) {
		filterTagLabel.style.fontWeight = "normal";

		if (filterTagLabel.classList.contains(tag)) {
			filterTagLabel.style.fontWeight = "bold";
		}
	}
}