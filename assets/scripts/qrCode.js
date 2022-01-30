let input = document.getElementById("input")

function autoUpdate() {
	document.getElementById("qrDisplay").src = "assets/images/load.gif";
	let schema = "";

	switch(document.getElementById("outputTypePicker").selectedIndex) {
		case 0:
			input.placeholder = "example.com";

			if (input.value.indexOf("http://") === -1 && input.value.indexOf("https://") === -1) {
				schema = "https://";
			}
			else {
				schema = ""
			}

			break;
		case 1:
			input.placeholder = "+xx xxx xxxx";
			schema = "tel:";
			break;
		case 2:
			input.placeholder = "person@example.com";
			schema = "mailto:";
			break;
		case 3:
			input.placeholder = "Text";
			schema = "";
	}

	let size = document.getElementById("size");

	if (size.value === "") {
		size.value = "300";
	}

	let fileExtension;

	switch (document.getElementById("fileType").selectedIndex) {
		case 0:
			fileExtension = "png";
			size.placeholder = "Size (px)";
			break;
		case 1:
			fileExtension = "jpg";
			size.placeholder = "Size (px)";
			break;
		case 2:
			fileExtension = "svg";
			size.placeholder = "Size (logical units)";
	}

	let dataOutput = input.value === "" ? schema + input.placeholder : schema + input.value;
	let foreColour = document.getElementById("foreColour").value.slice(1);
	let backgroundColor = document.getElementById("backgroundColour").value.slice(1);
	let link = `https://api.qrserver.com/v1/create-qr-code/?color=${encodeURIComponent(foreColour)}&bgcolor=${encodeURIComponent(backgroundColor)}&data=${encodeURIComponent(dataOutput)}&margin=2&size=${encodeURIComponent(size.value)}x${encodeURIComponent(size.value)}&format=${encodeURIComponent(fileExtension)}`;
	document.getElementById("qrDisplay").src = link;
	document.getElementById("qrDisplayA").href = link;
}