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
	shortenUrlCheckbox = document.getElementById("shortenUrl")
	shortenUrlLabel = document.getElementById("shortenUrlLabel")
	inputField = document.getElementById("input")
	fileTypePicker = document.getElementById("fileType")
	sizeInput = document.getElementById("size")

	# Select schema
	inputTypeName = inputTypePicker[inputTypePicker.selectedIndex].text

	if inputTypeName == "Website" and (inputField.value.indexOf("http://") == 0 or inputField.value.indexOf("https://") == 0) # Exception for if they entered website schema
		schema = ""
	else
		schema = schemaDict[inputTypeName]

	# Select file type
	fileType = fileTypePicker[fileTypePicker.selectedIndex].text

	# Set placeholders
	inputField.placeholder = placeholderDict[inputTypeName]
	sizeInput.placeholder = "Size (#{sizeUnitDict[fileType]})"

	# Hide/show shorten URL checkbox and label
	shortenUrlLabel.style.display = if inputTypeName == "Website" then "inline" else "none"
	shortenUrlCheckbox.style.display = if inputTypeName == "Website" then "inline-block" else "none"

	# Prepare output fields
	dataOutput = if inputField.value == "" then schema + inputField.placeholder else schema + inputField.value
	foreColour = document.getElementById("foreColour").value.slice(1)
	backgroundColor = document.getElementById("backgroundColour").value.slice(1)
	size = if sizeInput.value == "" then "300" else sizeInput.value
	fileExtension = fileType.toLowerCase()

	# Create QR code URL fields
	if inputTypeName == "Website" and shortenUrlCheckbox.checked and isValidHttpUrl(dataOutput) # If link should be shortened
		fetch(
			"https://api.1pt.co/addURL?long=#{dataOutput}",
			{
				"method": "GET"
			}
		)
		.then(
			(response) =>
				response.json().then(
					(data) =>
						updatePage(foreColour, backgroundColor, "https://1pt.co/#{data.short}", size, fileExtension)
				)
		)
		.catch(
			(err) =>
				console.error(err)
		)
	else if not inputTypeName == "Website" or isValidHttpUrl(dataOutput) # Not shortened website
		updatePage(foreColour, backgroundColor, dataOutput, size, fileExtension)

updatePage = (foreColour, backgroundColor, dataOutput, size, fileExtension) ->
	link = "https://api.qrserver.com/v1/create-qr-code/\
	?color=#{encodeURIComponent(foreColour)}\
	&bgcolor=#{encodeURIComponent(backgroundColor)}\
	&data=#{encodeURIComponent(dataOutput)}\
	&margin=2\
	&size=#{encodeURIComponent(size)}x#{encodeURIComponent(size)}\
	&format=#{encodeURIComponent(fileExtension)}"
	document.getElementById("qrDisplay").firstElementChild.href = link
	document.getElementById("qrCodeImage").src = link

isValidHttpUrl = (string) ->
	try
		url = new URL(string);
	catch
		return false

	if not (url.protocol == "http:" or url.protocol == "https:")
		return false

	if string.indexOf(".") == -1
		return false

	return true