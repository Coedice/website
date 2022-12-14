---
---
sha256 = (string) ->
	utf8 = new TextEncoder().encode(string);

	return crypto.subtle.digest('SHA-256', utf8).then(
		(hashBuffer) =>
			hashArray = Array.from(new Uint8Array(hashBuffer))
			hashHex = hashArray
				.map(
					(bytes) =>
						bytes.toString(16).padStart(2, '0')
				)
				.join('')
			return hashHex
	)


window.generateKey = () ->
	key = "1v"  # Version number

	# Reset copy button
	document.getElementById("copyAnonKey").innerText = "Copy"

	# Get participant name
	participantName = document.getElementById("participantNameInput").value

	# Apply filters on participant names
	modifiedParticipantName = participantName.replace(/ /g, "")  # Remove spaces
	modifiedParticipantName = modifiedParticipantName.normalize("NFD").replace(/[\u0300-\u036f]/g, "")  # Remove diacritics
	modifiedParticipantName = punycode.toASCII(modifiedParticipantName)  # Encode non-latin characters in punycode
	modifiedParticipantName = modifiedParticipantName.replace(/[^\x20-\x7E]/g, "")  # Filter to only printable US-ASCII
	modifiedParticipantName = modifiedParticipantName.toLowerCase()

	# Create hash
	sha256(modifiedParticipantName).then(
		(hash) =>
			key += hash

			# Add checksum
			digitsSum = 0

			for digitChar in key
				digitsSum += digitChar.charCodeAt(0)  # Add ASCII codepoint

			digitsSum = digitsSum % 1000  # Restrict to three-digit numbers
			paddedDigitsSum = String(digitsSum).padStart(3, '0')
			key += paddedDigitsSum

			# Add spans for colouring
			colouredKey = ""
			previous_character_was_digit = false

			for character in key
				if !isNaN(character) and not previous_character_was_digit  # If first contiguous digit
					colouredKey += "<span>#{character}"
					previous_character_was_digit = true
				else if isNaN(character) and previous_character_was_digit # If first letter after digit
					colouredKey += "</span>#{character}"
					previous_character_was_digit = false
				else
					colouredKey += character

			# Output key
			document.getElementById("output").innerHTML = colouredKey
	)


window.copyKey = () ->
	# Perform copy
	copyBox = document.getElementById("copyBox")
	copyBox.value = document.getElementById("output").innerText
	copyBox.select()
	copyBox.setSelectionRange(0, 99999);  # For mobile devices
	navigator.clipboard.writeText(copyBox.value)

	# Change copy button text
	document.getElementById("copyAnonKey").innerText = "Copied!"

window.onload = () ->
	generateKey()