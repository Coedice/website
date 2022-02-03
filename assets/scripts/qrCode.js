function autoUpdate() {
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
			sizeInput.placeholder = "Image size (px)";
			break;
		case 1:
			fileExtension = "jpg";
			sizeInput.placeholder = "Image size (px)";
			break;
		case 2:
			fileExtension = "svg";
			sizeInput.placeholder = "Size (logical units)";
	}

	let dataOutput = dataInput.value === "" ? schema + dataInput.placeholder : schema + dataInput.value;
	let foreColour = document.getElementById("foreColour").value.slice(1);
	let size = sizeInput.value === "" ? "300" : sizeInput.value
	let backgroundColor = document.getElementById("backgroundColour").value.slice(1);
	let link = `https://api.qrserver.com/v1/create-qr-code/?color=${encodeURIComponent(foreColour)}&bgcolor=${encodeURIComponent(backgroundColor)}&data=${encodeURIComponent(dataOutput)}&margin=2&size=${encodeURIComponent(size)}x${encodeURIComponent(size)}&format=${encodeURIComponent(fileExtension)}`;
	document.getElementById("qrDisplay").firstElementChild.href = link;
	document.getElementById("qrCodeImage").src = link;
}

window.onload = autoUpdate