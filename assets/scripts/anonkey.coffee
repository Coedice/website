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
	key = "2v"  # Version number

	# Reset copy button
	document.getElementById("copyAnonKey").innerText = "Copy"

	# Get participant name
	participantName = document.getElementById("participantNameInput").value

	# Get participant number
	participantNumber = Number(document.getElementById("participantNumberInput").value)

	# Require non-negative participant number
	if participantNumber < 0
		participantNumber = 0

	# Require integer participant number
	participantNumber = floor(participantNumber)

	# Add to key
	key += participantNumber.toString(16) + "n"

	# Apply filters on participant names
	modifiedParticipantName = participantName.replace(/ /g, "")  # Remove spaces
	modifiedParticipantName = modifiedParticipantName.normalize("NFD").replace(/[\u0300-\u036f]/g, "")  # Remove diacritics
	modifiedParticipantName = punycode.toASCII(modifiedParticipantName)  # Encode non-latin characters in punycode
	modifiedParticipantName = modifiedParticipantName.replace(/[^\x20-\x7E]/g, "")  # Filter to only printable US-ASCII
	modifiedParticipantName = modifiedParticipantName.toLowerCase()

	# Salt name with participant number
	saltedParticipantName = modifiedParticipantName + participantNumber

	# Create hash
	sha256(saltedParticipantName).then(
		(hash) =>
			key += hash

			# Add checksum
			digitsSum = 0

			for digitChar in key
				digitsSum += digitChar.charCodeAt(0)  # Add ASCII codepoint

			digitsSum = digitsSum % (16**3)  # Restrict to three-digit hex numbers
			digitsSum = digitsSum.toString(16).padStart(3, '0')  # Convert to hexadecimal
			key += digitsSum

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