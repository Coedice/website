function autoUpdate() {
	document.getElementById("qrDisplay").src = "assets/images/load.gif";
	let foreColour = document.getElementById("foreColour").value;
	let backgroundColor = document.getElementById("backgroundColour").value;

	// Data type
	let input = document.getElementById("input").value;
	let typePicker = document.getElementById("outputTypePicker").selectedIndex;
	var dataOutput;

	if (typePicker == "0") { // Website
		document.getElementById("input").placeholder = "example.com";
		dataOutput = input;

		if (input == "") {
			dataOutput = "gavindou.ch"
		}
		else if (dataOutput.indexOf("http://") == -1 && dataOutput.indexOf("https://") == -1) {
			dataOutput = "https://" + dataOutput;
		}
	}

	else if (typePicker == "1") { // Phone number
		if (input == "") {
			dataOutput = "tel:+xx xxx xxxx"
		}
		else {
			document.getElementById("input").placeholder = "+xx xxx xxxx";
			dataOutput = "tel:" + input;
		}
	}
	else if (typePicker == "2") { // Email address
		if (input == "") {
			dataOutput = "mailto:person@example.com"
		}
		else {
			document.getElementById("input").placeholder = "person@example.com";
			dataOutput = "mailto:" + input;
		}
	}
	else if (typePicker == "3") { // Text
		if (input == "") {
			dataOutput = "Text"
		}
		else {
			document.getElementById("input").placeholder = "Text";
			dataOutput = input;
		}
	}

	// Default size
	var size = document.getElementById("size").value;

	if (size == "") {
		size = "300";
	}

	// File type
	let fileTypePicker = document.getElementById("fileType").selectedIndex;
	var fileType;

	if (fileTypePicker == "0") { // PNG
		fileType = "png";
		document.getElementById("size").placeholder = "Size (px)";
	}
	else if (fileTypePicker == "1") { // JPG
		fileType = "jpg";
		document.getElementById("size").placeholder = "Size (px)";
	}
	else if (fileTypePicker == "2") { // SVG
		fileType = "svg";
		document.getElementById("size").placeholder = "Size (Logical units)";
	}

	let link = "https://api.qrserver.com/v1/create-qr-code/?color=" + encodeURIComponent(foreColour.slice(1)) + "&bgcolor=" + encodeURIComponent(backgroundColor.slice(1)) + "&data=" + encodeURIComponent(dataOutput) + "&margin=2&size=" + encodeURIComponent(size) + "x" + encodeURIComponent(size) + "&format=" + encodeURIComponent(fileType);
	document.getElementById("qrDisplay").src = link;
	document.getElementById("qrDisplayA").href = link;
}