---
---
window.autoUpdate = () ->
	# Dictionaries
	placeholderDict = {
		"Website": "example.com"
		"Phone Number": "+xx xxx xxxx"
		"Email Address": "person@example.com"
		"Text": "Placeholder"
	}

	schemaDict = {
		"Website": "https://"
		"Phone Number": "tel:"
		"Email Address": "mailto:"
		"Text": ""
	}

	sizeUnitDict = {
		"PNG": "px"
		"JPG": "px"
		"SVG": "logical units"
	}

	# Get DOM elements
	inputTypePicker = document.getElementById("outputTypePicker")
	inputField = document.getElementById("input")
	fileTypePicker = document.getElementById("fileType")
	sizeInput = document.getElementById("size")

	# Select schema
	inputTypeName = inputTypePicker[inputTypePicker.selectedIndex].text

	if inputTypeName == "Website" and (inputField.value.indexOf("http://") == 0 || inputField.value.indexOf("https://") == 0) # Exception for if they entered website schema
		schema = ""
	else
		schema = schemaDict[inputTypeName]

	# Select file type
	fileType = fileTypePicker[fileTypePicker.selectedIndex].text

	# Set placeholders
	inputField.placeholder = placeholderDict[inputTypeName]
	sizeInput.placeholder = "Size (#{sizeUnitDict[fileType]})"

	# Prepare output fields
	dataOutput = encodeURIComponent(if inputField.value == "" then schema + inputField.placeholder else schema + inputField.value)
	foreColour = encodeURIComponent(document.getElementById("foreColour").value.slice(1))
	backgroundColor = encodeURIComponent(document.getElementById("backgroundColour").value.slice(1))
	size = encodeURIComponent(if sizeInput.value == "" then "300" else sizeInput.value)
	fileExtension = encodeURIComponent(fileType.toLowerCase())

	# Update page with response
	link = "https://api.qrserver.com/v1/create-qr-code/?color=#{foreColour}&bgcolor=#{backgroundColor}&data=#{dataOutput}&margin=2&size=#{size}x#{size}&format=#{fileExtension}"
	document.getElementById("qrDisplay").firstElementChild.href = link
	document.getElementById("qrCodeImage").src = link
	console.log(dataOutput)
	console.log(link)