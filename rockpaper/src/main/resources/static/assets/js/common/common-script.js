"use strict";

jQuery(document).ready(function() {

	$('#ticketModal').on('show.bs.modal', function(event) {

		var target = $(event.relatedTarget); // Button that triggered the modal
		var id = target.data('id');
		var name = target.data('name');
		var remote = target.data('remote');

		var modal = $(this);
		if(id && name) {
			modal.find('.modal-title').text(name + '(' + id + ')');
		} else if(name) {
			modal.find('.modal-title').text(name);
		}

		if(remote) {
			modal.find('.modal-body').load(remote, function() {});
		}

		// var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		// var modal = $(this)
		// modal.find('.modal-title').text('New message to ' + recipient)
		// modal.find('.modal-body input').val(recipient)

		// var button = $(e.relatedTarget);
		// var modal = $(this);

		// modal.find('.modal-body').load(button.data("remote"));
	});

	$('#ticketModal').on('hide.bs.modal', function(event) {

		var target = $(event.target);
		var isSummernote = target.hasClass('note-modal');	// Summernote의 Link, Image, Video Dialog의 경우 

		var modal = $(this);

		if(!isSummernote) {
			modal.find('.modal-body').html('');
		}
	});
});

var getSqlResultMap = function(sqlId, params) {

	var data = new Object();
	data['sqlId'] = sqlId;

	if(params) {

		params.forEach(function(param, index){
			data[param.name] = param.value;
		});
	}

	var result;
	$.ajax({
		url: '/api/common/sqlMap',
		method: "POST",
		data: data,
		async: false
	}).done(function (response, textStatus, xhr) {

		// console.log("response", response);
		// console.log("textStatus", textStatus);
		// console.log("xhr", xhr);
		if(xhr.status == 200) {
			result = response;
		}
	}).fail(function(response, textStatus, errorThrown) {

		console.log("response", response);
		console.log("textStatus", textStatus);
		console.log("errorThrown", errorThrown);
		alert('response : ' + response + '\n' + 'textStatus : ' + textStatus + '\n' + 'errorThrown : ' + errorThrown);
	});

	return result;
}

var getSqlResultList = function(sqlId, params) {

	var data = new Object();
	data['sqlId'] = sqlId;
	
	if(params) {

		params.forEach(function(param, index){
			data[param.name] = param.value;
		});
	}

	var result;
	$.ajax({
		url: '/api/common/sqlList',
		method: "POST",
		data: data,
		async: false
	}).done(function (response, textStatus, xhr) {

		// console.log("response", response);
		// console.log("textStatus", textStatus);
		// console.log("xhr", xhr);
		if(xhr.status == 200) {
			result = response;
		}
	}).fail(function(response, textStatus, errorThrown) {

		console.log("response", response);
		console.log("textStatus", textStatus);
		console.log("errorThrown", errorThrown);
		alert('response : ' + response + '\n' + 'textStatus : ' + textStatus + '\n' + 'errorThrown : ' + errorThrown);
	});

	return result;
}

var getUniqueKey = function(prefix) {

	if(prefix) {
		return prefix + '_' + Math.floor(Math.random() * (new Date()).getTime());
	} else {
		return Math.floor(Math.random() * (new Date()).getTime());
	}
}

! function (a) {
	a.fn.datepicker.dates.ko = {
		days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
		daysShort: ["일", "월", "화", "수", "목", "금", "토"],
		daysMin: ["일", "월", "화", "수", "목", "금", "토"],
		months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		today: "오늘",
		clear: "삭제",
		format: "yyyy-mm-dd",
		titleFormat: "yyyy년 mm월",
		weekStart: 0
	}
}(jQuery);