"use strict";

var getDefaultRangeDateValue = function(defValue, dateFormat) {

	var defDateType = defValue.split(',');
	var startDateType, endDateType;
	if(defDateType.length == 2) {
	
		startDateType = defDateType[0];
		endDateType = defDateType[1];
	}

	var startDate = getDateValue(startDateType, dateFormat);
	var endDate = getDateValue(endDateType, dateFormat);

	return startDate + "|" + endDate;
}

var setDefaultRangeDateValue = function(defValue, columnIndex) {

	var defDateType = defValue.split(',');
	var startDateType, endDateType;
	if(defDateType.length == 2) {
	
		startDateType = defDateType[0];
		endDateType = defDateType[1];
	}

	var startDate = getDateValue(startDateType);
	var endDate = getDateValue(endDateType);

	var searchForm = $("#searchForm");
	searchForm.find("input[data-col-index='" + columnIndex + "'][name='start']").val(startDate);
	searchForm.find("input[data-col-index='" + columnIndex + "'][name='end']").val(endDate);
}

var getDefaultDateValue = function(defValue, dateFormat) {

	var date = getDateValue(defValue, dateFormat);
	return date
}

var setDefaultDateValue = function(defValue, columnIndex) {

	var date = getDateValue(defValue);

	var searchForm = $("#searchForm");
	searchForm.find("input[data-col-index='" + columnIndex + "']").val(date);
}

var getDateValue = function(str, dateFormat='YYYY-MM-DD') {

	var type = str.charAt(0);
	var term = str.substring(1);

	var date;
	if (type.toUpperCase() == 'D') {
		date = moment().add(term, 'days').format(dateFormat);
	} else if (type.toUpperCase() == 'M') {

		if(term == '-0') {	// 해당월의 시작일
			date = moment().startOf('months').format(dateFormat);
		} else if(term == '+0') {	// 해당월의 마지막일
			date = moment().endOf('months').format(dateFormat);
		} else {
			date = moment().add(term, 'months').format(dateFormat);
		}
	} else if (type.toUpperCase() == 'F') {

		// 특정월의 시작일
		date = moment().add(term, 'months').startOf('months').format(dateFormat);
	} else if (type.toUpperCase() == 'L') {

		// 특정월의 마지막일
		date = moment().add(term, 'months').endOf('months').format(dateFormat);
	} else if (type.toUpperCase() == 'Y') {

		if(term == '-0') {	// 해당년의 시작일
			date = moment().startOf('years').format(dateFormat);
		} else if(term == '+0') {	// 해당년의 마지막일
			date = moment().endOf('years').format(dateFormat);
		} else {
			date = moment().add(term, 'years').format(dateFormat);
		}
	}

	return date;
}

var printSampleDate = function() {

	// years
	console.log("== years ==");
	const startOfYear = moment().startOf('years').format('YYYY-MM-DD');
	console.log("startOfYear", startOfYear);
	const endOfYear = moment().endOf('years').format('YYYY-MM-DD');
	console.log("endOfYear", endOfYear);
	
	const startOfLastYear = moment().startOf('years').add(-1, 'years').format('YYYY-MM-DD');
	console.log("startOfLastYear", startOfLastYear);
	const endOfLastYear = moment().endOf('years').add(-1, 'years').format('YYYY-MM-DD');
	console.log("endOfLastYear", endOfLastYear);

	const startOfNextYear = moment().startOf('years').add(1, 'years').format('YYYY-MM-DD');
	console.log("startOfNextYear", startOfNextYear);
	const endOfNextYear = moment().endOf('years').add(-1, 'years').format('YYYY-MM-DD');
	console.log("endOfNextYear", endOfNextYear);

	// months
	console.log("== months ==");
	const startOfMonth = moment().startOf('months').format('YYYY-MM-DD');
	console.log("startOfMonth", startOfMonth);
	const endOfMonth = moment().endOf('months').format('YYYY-MM-DD');
	console.log("endOfMonth", endOfMonth);

	const startOfLastMonth = moment().startOf('months').add(-1, 'months').format('YYYY-MM-DD');
	console.log("startOfLastMonth", startOfLastMonth);
	const endOfLastMonth = moment().endOf('months').add(-1, 'months').format('YYYY-MM-DD');
	console.log("endOfLastMonth", endOfLastMonth);

	const startOfNextMonth = moment().startOf('months').add(1, 'months').format('YYYY-MM-DD');
	console.log("startOfNextMonth", startOfNextMonth);
	const endOfNextMonth = moment().endOf('months').add(1, 'months').format('YYYY-MM-DD');
	console.log("endOfNextMonth", endOfNextMonth);
	
	// days
	console.log("== days ==");
	const today = moment().format('YYYY-MM-DD');
	console.log("today", today);
	
	const beforeOf7Day = moment().add(-7, 'days').format('YYYY-MM-DD');
	console.log("beforeOf7Day", beforeOf7Day);

	const afterOf7Day = moment().add(7, 'days').format('YYYY-MM-DD');
	console.log("afterOf7Day", afterOf7Day);

	// quarters
	console.log("== quarters ==");
	const startOfQuarters = moment().startOf('quarters').format('YYYY-MM-DD');
	console.log("startOfQuarters", startOfQuarters);
	const endOfQuarters = moment().endOf('quarters').format('YYYY-MM-DD');
	console.log("endOfQuarters", endOfQuarters);

	const startOfLastQuarters = moment().startOf('quarters').add(-1, 'quarters').format('YYYY-MM-DD');
	console.log("startOfLastQuarters", startOfLastQuarters);
	const endOfLastQuarters = moment().endOf('quarters').add(-1, 'quarters').format('YYYY-MM-DD');
	console.log("endOfLastQuarters", endOfLastQuarters);

	const startOfNextQuarters = moment().startOf('quarters').add(1, 'quarters').format('YYYY-MM-DD');
	console.log("startOfNextQuarters", startOfNextQuarters);
	const endOfNextQuarters = moment().endOf('quarters').add(1, 'quarters').format('YYYY-MM-DD');
	console.log("endOfNextQuarters", endOfNextQuarters);

	// weeks
	console.log("== weeks ==");
	const startOfWeeks = moment().startOf('weeks').format('YYYY-MM-DD');
	console.log("startOfWeeks", startOfWeeks);
	const endOfWeeks = moment().endOf('weeks').format('YYYY-MM-DD');
	console.log("endOfWeeks", endOfWeeks);

	const startOfLastWeeks = moment().startOf('weeks').add(-1, 'weeks').format('YYYY-MM-DD');
	console.log("startOfLastWeeks", startOfLastWeeks);
	const endOfLastWeeks = moment().endOf('weeks').add(-1, 'weeks').format('YYYY-MM-DD');
	console.log("endOfLastWeeks", endOfLastWeeks);

	const startOfNextWeeks = moment().startOf('weeks').add(1, 'weeks').format('YYYY-MM-DD');
	console.log("startOfNextWeeks", startOfNextWeeks);
	const endOfNextWeeks = moment().endOf('weeks').add(1, 'weeks').format('YYYY-MM-DD');
	console.log("endOfNextWeeks", endOfNextWeeks);
}