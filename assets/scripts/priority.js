var weeklyGoal = 0;
var totalPriorities = 0;
var streak = 0;

function choiceButtonTapped(buttonIndex) {
	document.getElementById("choiceButtons").children.item(0).style.opacity = 0.5;
	document.getElementById("choiceButtons").children.item(1).style.opacity = 0.5;
	document.getElementById("choiceButtons").children.item(2).style.opacity = 0.5;
	document.getElementById("choiceButtons").children.item(3).style.opacity = 0.5;
	document.getElementById("choiceButtons").children.item(buttonIndex).style.opacity = 1;

	switch(buttonIndex) {
		case 0:
			weeklyGoal = 8;
			break;
		case 1:
			weeklyGoal = 11;
			break;
		case 2:
			weeklyGoal = 15;
			break;
		case 3:
			weeklyGoal = 20;
			break;
		default:
			weeklyGoal = 15;
			break;
	}

	document.getElementById("weeklyGlobalGoalTextField").value = weeklyGoal;
}

function findSlider(index) {
	return document.getElementById("subjectsTable").children.item(0).children.item(index + 1).children.item(1).children.item(0);
}

function findAllocationLabel(index) {
	return document.getElementById("subjectsTable").children.item(0).children.item(index + 1).children.item(2).children.item(0);
}

function findTimePerWeekLabel(index) {
	return document.getElementById("subjectsTable").children.item(0).children.item(index + 1).children.item(3).children.item(0);
}

function durationFormatter(durationHours) {
	let hours = Math.floor(durationHours);
	let minutes = Math.floor((durationHours%1)*60);
	return hours + "h " + minutes + "m";
}

function calculateTotalPriorities() {
	let maxSubjectIndex = document.getElementById("subjectsTable").children.item(0).children.length - 2;
	var totPriorities = 0;
	var i = 0;

	while (i <= maxSubjectIndex) {
		totPriorities += parseInt(findSlider(i).value);
		i++;
	}

	totalPriorities = totPriorities;
}

function updateSubjectData() {
	calculateTotalPriorities();
	let maxSubjectIndex = document.getElementById("subjectsTable").children.item(0).children.length - 2;
	var i = 0;

	while (i <= maxSubjectIndex) {
		var allocation = parseInt(findSlider(i).value)/totalPriorities;
		allocation = isNaN(allocation) || !isFinite(allocation) ? 0 : allocation;
		findAllocationLabel(i).innerHTML = (allocation*100).toFixed(2) + "&percnt;";
		findTimePerWeekLabel(i).innerHTML = durationFormatter(allocation*weeklyGoal);
		i++;
	}
}

function hit() {
	streak++;
	document.getElementById("streakLabel").innerHTML = streak + " weeks";
}

function miss() {
	streak = 0;
	document.getElementById("streakLabel").innerHTML = "0 weeks";
}

function manualWeekGoalChoice() {
	document.getElementById("choiceButtons").children.item(0).style.opacity = 1;
	document.getElementById("choiceButtons").children.item(1).style.opacity = 1;
	document.getElementById("choiceButtons").children.item(2).style.opacity = 1;
	document.getElementById("choiceButtons").children.item(3).style.opacity = 1;

	weeklyGoal = document.getElementById("weeklyGlobalGoalTextField").value;
	updateSubjectData()
}