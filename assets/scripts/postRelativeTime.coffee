---
---
class DateDifference
	constructor: (@date1, @date2) ->

	daysDifference: () ->
		time1 = @date1.getTime()
		time2 = @date2.getTime()
		return parseInt((time2 - time1)/(24*3600*1000))

	displayMessage: () ->
		message = ""

		if @daysDifference() < 7
			message = "#{@daysDifference()} days"
		else if @daysDifference() < 31
			message = "#{@daysDifference()//7} weeks"
		else if @daysDifference() < 365
			message = "#{@daysDifference()//30.417} months"
		else
			message = "#{@daysDifference()//365.24} years"

		return "#{message} ago"


window.onload = () ->
	for timeDifferenceSpan in document.getElementsByClassName("relativePostTime")
		isoDateString = timeDifferenceSpan.innerText
		dateDifference = new DateDifference(new Date(isoDateString), new Date())
		timeDifferenceSpan.innerText = ", #{dateDifference.displayMessage()}"
		timeDifferenceSpan.style.display = "inline"
