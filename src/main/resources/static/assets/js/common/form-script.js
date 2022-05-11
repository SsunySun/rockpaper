"use strict";

/**
 * Form Field Require Setting
 * @param {*} name 
 * @param {*} type 
 * @param {*} typeMessage 
 * @param {*} minLength 
 * @param {*} maxLength 
 * @returns 
 */
var getFieldsType = function(name, type, typeMessage, minLength, maxLength) {

	let field = new Object();
	let validators = new Object();
	if (type == "text") {

		let notEmpty = new Object();
		let emptyMessage = new Object();

		emptyMessage = name + '은(는) 필수값입니다.';
		notEmpty.message = emptyMessage;
		validators.notEmpty = notEmpty;

		let stringLength = new Object();
		if(typeof minLength !== 'undefined') {
			stringLength.min = minLength
		}

		if(typeof maxLength !== 'undefined') {
			stringLength.max = maxLength;
		}

		if(typeof minLength !== 'undefined' && typeof maxLength !== 'undefined') {
			field.stringLength = stringLength;
		}

		let regexp = new Object();
		regexp.regexp = /^[a-zA-Z0-9_]+$/;
		regexp.message = 'Can only consist of alphabetical, number and underscore';
		field.regexp = regexp;
	} else if(type == "number") {

		let notEmpty = new Object();
		let emptyMessage = new Object();

		emptyMessage = name + ' 은(는) 필수값입니다.';
		notEmpty.message = emptyMessage;
		validators.notEmpty = notEmpty;

		let digits = new Object();
		let digitsMessage = new Object();

		digitsMessage = 'The velue is not a valid digits';
		digits.digitsMessage = digitsMessage;
		validators.digits = digits;
	} else if(type == 'custom') {

		let notEmpty = new Object();
		let emptyMessage = new Object();

		emptyMessage = typeMessage;
		notEmpty.message = emptyMessage;
		validators.notEmpty = notEmpty;
	}

	field.validators = validators;

	return field;
}

var toUpperCase = function(element) {
	element.value = element.value.toUpperCase();
}

var toLowerCase = function(element) {
	element.value = element.value.toLowerCase();
}

/**
 * Relation Refresh 
 * @param {*} id 
 * @param {*} formId 
 * @param {*} key 
 * @param {*} entId 
 * @param {*} fieldId 
 * @param {*} auth 
 * @param {*} mode 
 */
var getRelationTable = function(id, formId, key, entId, fieldId, auth, mode) {

	var params = new Array();
	params.push({name: 'formId', value: formId});
	params.push({name: 'key', value: key});
	params.push({name: 'entId', value: entId});
	params.push({name: 'fieldId', value: fieldId});
	params.push({name: 'auth', value: auth});
	params.push({name: 'mode', value: mode});

	$("#" + id + "-relation-table").load( 
		"/common/relationListByForm",
		params,
		function(response, textStatus, xhr) {

			if(xhr.status == 200) {
				
				// console.log("response", response);
				// console.log("textStatus", textStatus);
				// console.log("xhr", xhr);
			} else {

				console.log("response", response);
				console.log("textStatus", textStatus);
				console.log("xhr", xhr);
				alert('message : ' + response.message + '\n' + 'result : ' + response.result);
			}
	});
}

var openWindowByKey = function(key, entId) {
	var popup = window.open('/common/form?key=' + key + '&entId=' + entId, '_blank');
}

var openWindowByFormAndKey = function(formId, key) {
	var popup = window.open('/common/form?formId=' + formId + '&key=' + key, '_blank');
}

var openWindow = function(url, target) {
	var popup = window.open(url, target);
}

var checkRelationRequireField = function(formId) {

	let isValid = true;

	const inputs = $("#" + formId + " *").find('input.require').not('input[readonly]').not(':disabled');
	var resultMessage = '';
	inputs.each(function() {
		
		if($(this).val().trim() == '' || $(this).val().trim() == '~') {

			$(this).addClass('is-invalid');
			isValid = false;
			$(this).focus();
			resultMessage = $(this).attr('placeholder');
		} else {
			$(this).removeClass('is-invalid');
		}
	});

	const selects = $("#" + formId + " *").find('select.require').not(':disabled');
	selects.each(function() {

		if($(this).val().trim() == '') {

			$(this).addClass('is-invalid');
			isValid = false;
			$(this).focus();
			resultMessage = $(this).attr('placeholder');
		} else {
			$(this).removeClass('is-invalid');
		}
	});

	if(resultMessage) {
		alert(resultMessage);
	}

	return isValid;
}

var hideControl = function(controlId) {
	$('#' + controlId).hide();
}

var showControl = function(controlId) {
	$('#' + controlId).show();
}

var setAutoSize = function(id) {

	var element = $('#' + id);
	autosize(element);
}