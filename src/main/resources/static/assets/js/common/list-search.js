"use strict";
jQuery.fn.dataTable.render.ellipsis = function ( cutoff, wordbreak, escapeHtml ) {
	var esc = function ( t ) {
		return t
			.replace( /&/g, '&amp;' )
			.replace( /</g, '&lt;' )
			.replace( />/g, '&gt;' )
			.replace( /"/g, '&quot;' );
	};

	return function ( d, type, row ) {
		// Order, search and type get the original data
		if ( type !== 'display' ) {
			return d;
		}

		if ( typeof d !== 'number' && typeof d !== 'string' ) {
			return d;
		}

		d = d.toString(); // cast numbers

		if ( d.length <= cutoff ) {
			return d;
		}

		var shortened = d.substr(0, cutoff-1);

		// Find the last white space character in the string
		if ( wordbreak ) {
			shortened = shortened.replace(/\s([^\s]*)$/, '');
		}

		// Protect against uncontrolled HTML input
		if ( escapeHtml ) {
			shortened = esc( shortened );
		}

		return '<span class="ellipsis" title="'+esc(d)+'">'+shortened+'&#8230;</span>';
	};
};

var KTDatatables = function() {

	$.fn.dataTable.Api.register('column().title()', function() {
		return $(this.header()).text().trim();
	});

	var initTable = function(ajax, columns, columnDefs, searchCols, order) {

		if(!order) {

			order = new Object();
			order.index = 0;
			order.type = 'asc'
		}

		// begin first table
		var table = $('#kt_datatable').DataTable({
			responsive: true,
			// Pagination settings
			dom: `<'row'<'col-sm-12'tr>>
			<'row'<'col-sm-12 col-md-4'i><'col-sm-12 col-md-8 dataTables_pager'lp>>`,
			// read more: https://datatables.net/examples/basic_init/dom.html

			buttons: [
				'print',
				'copyHtml5',
				'excelHtml5',
				{
					extend: 'csvHtml5',
					charset: 'utf-8',
					bom: true
				},
				'pdfHtml5',
			],

			lengthMenu: [5, 10, 25, 50],
			pageLength: 10,
			order: [[order.index, order.type]],

			language: {
				decimal: "",
				emptyTable: "데이터가 없습니다.",
				info:  "_START_ - _END_ (총 _TOTAL_ 건)",
				infoEmpty: "0건",
				infoFiltered: "(전체 _MAX_ 건 중 검색결과)",
				infoPostFix: "",
				thousands: ",",
				lengthMenu: "_MENU_ 개씩 보기",
				loadingRecords: "로딩중...",
				processing: "처리중...",
				search: "검색 : ",
				zeroRecords: "검색된 데이터가 없습니다.",
				paginate: {
					first: "첫 페이지",
					last: "마지막 페이지",
					next: "다음",
					previous: "이전"
				},
				aria: {
					sortAscending: " :  오름차순 정렬",
					sortDescending: " :  내림차순 정렬"
				}
			},

			fixedHeader: true,
			searchDelay: 500,
			// stateSave: true,
			processing: true,
			serverSide: true,
			ajax: ajax,
			columns: columns,
			columnDefs: columnDefs,
			/* searchCols: [
				null,
				null,
				{ search: "My filter" },
				{ search: "(London|New York)", escapeRegex: false },
				{ search: "^[0-9]", regex: true }
			], */
			searchCols: searchCols,
			initComplete: function() {
				this.api().columns().every(function() {
					
				});
			},
		});

		$('#kt_search').on('click', function(event) {

			event.preventDefault();
			var params = {};
			$('.datatable-input').each(function() {

				var index = $(this).data('col-index');
				if (params[index]) {
					params[index] += '|' + $(this).val();
				} else {
					params[index] = $(this).val();
				}
			});

			$.each(params, function(index, val) {
				// apply search params to datatable
				table.column(index).search(val ? val : '', false, false);
			});

			table.table().draw();
		});

		$('#kt_reset').on('click', function(e) {

			e.preventDefault();
			$('.datatable-input').each(function() {

				$(this).val($(this).prop("defaultValue"));
				table.column($(this).data('col-index')).search('', false, false);
			});

			table.table().draw();
		});

		$('#export_print').on('click', function(e) {
			e.preventDefault();
			table.button(0).trigger();
		});

		$('#export_copy').on('click', function(e) {
			e.preventDefault();
			table.button(1).trigger();
		});

		$('#export_excel').on('click', function(e) {
			e.preventDefault();
			table.button(2).trigger();
		});

		$('#export_csv').on('click', function(e) {
			e.preventDefault();
			table.button(3).trigger();
		});

		$('#export_pdf').on('click', function(e) {
			e.preventDefault();
			table.button(4).trigger();
		});

		$('#export_excel_all').on('click', function(e) {

			e.preventDefault();

			var params = {};
			$('.datatable-input').each(function() {

				var i = $(this).data('col-index');
				if (params[i]) {
					params[i] += '|' + $(this).val();
				} else {
					params[i] = $(this).val();
				}
			});

			// setting url info
			$.url.setUrl(config.layout.excel);
			$.url.param().lstId = object.id;
			$.each(params, function(index, val) {
				$.url.param()[columns[index].data] = val;
			});

			var param = '';
			$.each($.url.param(), function(key, value) {
				param += key + '=' + encodeURIComponent(value) + '&';
			});

			var url = $.url.attr('path') + '?' + param;
			var target = '_blank';
			openWindow(url, target);
		});
	};

	return {

		//main function to initiate the module
		init: function(ajax, columns, columnDefs, searchCols, order) {
			initTable(ajax, columns, columnDefs, searchCols, order);
		},
	};
}();

jQuery(document).ready(function() {

	/* Ajax Setting */
	var ajax = {
		url: config.layout.list,
		type: "POST",
		data: {
			lstId: object.id
		},
		dataType: "JSON",
		dataSrc: "result",
	};

	/* Column & Search(Filter) Setting */
	var columns = new Array();
	var searchCols = new Array();

	/* Column Define */
	var columnDefs = new Array();

	config.column.forEach(function(column, index) {

		if(column.type == 'view') {

			var columnDef = new Object();
			columnDef.targets = index;
			columnDef.render = $.fn.dataTable.render.ellipsis(20, true);
			columnDefs.push(columnDef);
		}

		// Column
		var colObj = new Object();
		colObj.title = column.name;
		colObj.defaultContent = '';
		colObj.data = column.data;
		if(!config.order) {
			colObj.orderable = false;
		}

		if(column.type == 'action') {

			colObj.responsivePriority = -1;
			var actionColumnDef = {
				targets: -1,
				title: 'Actions',
				orderable: false,
				render: function(data, type, full, meta) {
					
					var url = '';
					if(config.action.list_action_btn.url.indexOf('?') > 0) {
		
						if(full.ent_id) {
							url = config.action.list_action_btn.url + '&key=' + full.id + '&entId=' + full.ent_id;
						} else {
							url = config.action.list_action_btn.url + '&key=' + full.id;
						}
		
					} else {
		
						if(full.ent_id) {
							url = config.action.list_action_btn.url + '?key=' + full.id + '&entId=' + full.ent_id;
						} else {
							url = config.action.list_action_btn.url + '?key=' + full.id;
						}
					}
					return '\
						<a href="#" class="btn btn-icon btn-light-primary" title="Edit ticket" id="modify" data-toggle="modal" data-target="#ticketModal" data-remote="' + url + '" data-id="' + full.id + '" data-name="' + full.name + '">\
							<i class="la la-edit"></i>\
						</a>\
					';
				},
			};
			columnDefs.push(actionColumnDef);
		}

		if(column.type == 'view' || column.type == 'action') {
			columns.push(colObj);
		}

		// Search(filter)
		var searchObj = new Object();
		config.filter.forEach(function(filter) { 
			filter.forEach(function(subFilter) { 

				if(subFilter.id == column.data) {
					if(subFilter.def_val) {

						if(subFilter.uiitem.startsWith('Date.')) {

							if(subFilter.uiitem.startsWith('Date.Range')) {
								searchObj.search = getDefaultRangeDateValue(subFilter.def_val);
							} else {
								searchObj.search = getDefaultDateValue(subFilter.def_val, subFilter.config);
							}
						} else {
							searchObj.search = subFilter.def_val;
						}
					}
				}
			});
		});
		searchCols.push(searchObj);
	});

	KTDatatables.init(ajax, columns, columnDefs, searchCols, config.order);
});