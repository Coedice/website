function autoUpdate() {
	document.getElementById("qrDisplay").src = "assets/images/load.gif";
	let dataInput = document.getElementById("input")
	let schema = "";

	switch(document.getElementById("outputTypePicker").selectedIndex) {
		case 0:
			dataInput.placeholder = "example.com";

			if (dataInput.value.indexOf("http://") === -1 && dataInput.value.indexOf("https://") === -1) {
				schema = "https://";
			}
			else {
				schema = ""
			}

			break;
		case 1:
			dataInput.placeholder = "+xx xxx xxxx";
			schema = "tel:";
			break;
		case 2:
			dataInput.placeholder = "person@example.com";
			schema = "mailto:";
			break;
		case 3:
			dataInput.placeholder = "Text";
			schema = "";
	}

	let sizeInput = document.getElementById("size");
	let fileExtension;

	switch (document.getElementById("fileType").selectedIndex) {
		case 0:
			fileExtension = "png";
			sizeInput.placeholder = "Size (px)";
			break;
		case 1:
			fileExtension = "jpg";
			sizeInput.placeholder = "Size (px)";
			break;
		case 2:
			fileExtension = "svg";
			sizeInput.placeholder = "Size (logical units)";
	}

	let dataOutput = dataInput.value === "" ? schema + dataInput.placeholder : schema + dataInput.value;
	let foreColour = document.getElementById("foreColour").value.slice(1);
	let size = sizeInput.value === "" ? "300" : sizeInput.val
	let backgroundColor = document.getElementById("backgroundColour").value.slice(1);
	let link = `https://api.qrserver.com/v1/create-qr-code/?color=${encodeURIComponent(foreColour)}&bgcolor=${encodeURIComponent(backgroundColor)}&data=${encodeURIComponent(dataOutput)}&margin=2&size=${encodeURIComponent(sizeInput.value)}x${encodeURIComponent(sizeInput.value)}&format=${encodeURIComponent(fileExtension)}`;
	document.getElementById("qrDisplay").src = link;
	document.getElementById("qrDisplayA").href = link;
}