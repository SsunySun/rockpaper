'use strict';
// Class definition

var KTDatatableChild = function() {

	var initTable = function(data, translate, layout, toolbar, detail, columns) {

		var datatable = $('#kt_datatable').KTDatatable({
			// datasource definition
			data: data,

			// layout definition
			layout: layout,

			// column sorting
			// sortable: true,	// default: true
			// pagination: true,	// default: true

			// search: search,	// not used

			// Toolbar definition
			toolbar: toolbar,

			// Translate definition
			translate: translate,
			detail: detail,

			// columns definition
			columns: columns,
		});

		$('.datatable-input').on('keydown', function(key) {

			if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
				search();
			}
		});

		$('#kt_search').on('click', function(event) {

			event.preventDefault();
			search();
		});

		var search = function() {

			var params = new Object();
			$('.datatable-input').each(function() {

				var index = $(this).data('col-index');
				if (params[index]) {
					params[index] += '|' + $(this).val();
				} else {
					params[index] = $(this).val();
				}
			});

			var query = new Object();
			$.each(params, function(index, value) {

				$('.datatable-input').each(function() {

					var colIndex = $(this).data('col-index');
					if(index == colIndex) {

						var id = $(this).attr('id');
						if(id) {
							query[id] = value;
						}
					}
				});
			});

			datatable.setDataSourceParam('query', query);
			datatable.load();
		}

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
				$.url.param()[columns[Number(index) + 1].field] = val;
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

		init: function(data, translate, layout, toolbar, detail, columns) {
			initTable(data, translate, layout, toolbar, detail, columns);
		},
	};
}();

jQuery(document).ready(function() {

	/* Column & Search(Filter) Setting */
	var columns = new Array();

	var detailColObj = new Object();
	detailColObj.width = 30;
	detailColObj.field = 'rownum';
	detailColObj.title = '#';
	detailColObj.sortable = true;
	columns.push(detailColObj);

	config.column.forEach(function(column, index) {

		// Column
		var colObj = new Object();
		colObj.field = column.data;
		colObj.title = column.name;
		// colObj.sortable = true;	// 정렬

		if(!config.order) {
			colObj.sortable = false;
		} else {

			if(config.order.index == index) {
				colObj.sortable = config.order.type;
			}
		}

		if(column.type == 'action') {

			colObj.sortable = false;
			
			// column.data=='worktime'의 경우 근로시간 리스트의 경영기획팀에서만 버튼 사용을 위한 처리
			if(column.data == 'worktime' && isBusinessManagement) {

				colObj.template = function(row) {

					var url = config.action.list_action_btn.url;
					if(config.action.list_action_btn.url.indexOf('?') > 0) {
		
						url += '&auth=true';
						url += '&entId=' + row.ent_id;
						url += '&formId=' + row.form_id;
						url += '&work_date=' + row.work_date;
						url += '&charge_emp_id=' + row.charge_emp_id;
						url += '&used_work_time=' + row.used_work_time;
						url += '&compensation_time=' + row.compensation_time;

						if(row.key) {
							url += '&key=' + row.key;
						}
					} else {
		
						url += '?auth=true';
						url += '&entId=' + row.ent_id;
						url += '&formId=' + row.form_id;
						url += '&work_date=' + row.work_date;
						url += '&charge_emp_id=' + row.charge_emp_id;
						url += '&used_work_time=' + row.used_work_time;
						url += '&compensation_time=' + row.compensation_time;

						if(row.key) {
							url += '&key=' + row.key;
						}
					}

					var data_id = '';
					var data_name = '근무시간';

					// 버튼 클릭시 데이터 처리
					return '\
						<a href="#" class="btn btn-icon btn-light-primary" title="Update ticket" id="modify" data-toggle="modal" data-target="#ticketModal" data-remote="' + url + '" data-id="' + data_id + '" data-name="' + data_name + '">\
							<i class="la la-save"></i>\
						</a>\
					';
				}
			} else if(column.data != 'worktime') {

				colObj.template = function(row) {

					var url = '';
					if(config.action.list_action_btn.url.indexOf('?') > 0) {
		
						if(row.ent_id) {
	
							url = config.action.list_action_btn.url + '&key=' + row.id + '&entId=' + row.ent_id;
							if(row.form_id) {
								url += '&formId=' + row.form_id;
							}
						} else {
							url = config.action.list_action_btn.url + '&key=' + row.id;
						}
		
					} else {
		
						if(row.ent_id) {
	
							url = config.action.list_action_btn.url + '?key=' + row.id + '&entId=' + row.ent_id;
							if(row.form_id) {
								url += '&formId=' + row.form_id;
							}
						} else {
							url = config.action.list_action_btn.url + '?key=' + row.id;
						}
					}
					return '\
						<a href="#" class="btn btn-icon btn-light-primary" title="Edit ticket" id="modify" data-toggle="modal" data-target="#ticketModal" data-remote="' + url + '" data-id="' + row.id + '" data-name="' + row.name + '">\
							<i class="la la-edit"></i>\
						</a>\
					';
				}
			}
		}

		if(column.type == 'view') {
			columns.push(colObj);
		}

		if(column.type == 'action') {

			if(column.data == 'worktime' && isBusinessManagement) {
				columns.push(colObj);
			} else if(column.data != 'worktime') {
				columns.push(colObj);
			}
		}
	});

	// Search(filter)
	var initQuery = new Object();

	config.filter.forEach(function(filter) { 
		filter.forEach(function(subFilter) { 

			if(subFilter.def_val) {

				if(subFilter.uiitem.startsWith('Date.')) {

					if(subFilter.uiitem.startsWith('Date.Range')) {
						initQuery[subFilter.id] = getDefaultRangeDateValue(subFilter.def_val);
					} else {
						initQuery[subFilter.id] = getDefaultDateValue(subFilter.def_val, subFilter.config);
					}
				} else {
					initQuery[subFilter.id] = subFilter.def_val;
				}
			} else {
				initQuery[subFilter.id] = '';
			}
		});
	});

	var data = {
		type: 'remote',
		source: {
			read: {
				url: config.layout.list,
				method: 'POST',
				params: {
					lstId: object.id,
					query: initQuery
				},
				map: function(raw) {
					var dataSet = raw;
					if (typeof raw.result !== 'undefined') {
					  dataSet = raw.result;
					}
					return dataSet;
				}
			},
		},
		pageSize: 10, // display records per page
		saveState: false,	// localStorage 사용여부

		serverPaging: true,	// default: false
		serverFiltering: true,	// default: false
		serverSorting: true,	// default: false
		autoColumns: false	// default: false
	};

	var translate = {
		records: {
			processing: '처리중...',	// 'Please wait...'
			noRecords: '검색된 데이터가 없습니다.'	// 'No records found'
		},
		toolbar: {
			pagination: {
				items : {
					default: {
						first: '첫 페이지',	// 'First'
						prev: '이전',	// 'Previous'
						next: '다음',	// 'Next'
						last: '마지막 페이지',	// 'Last'
						more: '더보기',	// 'More pages'
						input: 'Page number',	// 'Page number',
						select: '페이지 수 선택'	// 'Select page size'
					},
					info: '{{start}} - {{end}} (총 {{total}} 건)'	// 'Showing {{start}} - {{end}} of {{total}}'
				}
			}
		}
	};

	var layout = {
		theme: 'default',	// datatable will support multiple themes and designs
		// class: 'datatable-brand',	// defalut: datatable-primary
		scroll: true,	// default: false
		// height: 300,	// default: null
		// minHeight: 500,	// default: null
		header: true,	// default: true
		footer: false,	// default: false
		customScrollbar: false,	// default: true

		// datatable spinner
		spinner: {
			overlayColor: '#000000',
			opacity: 0,
			type: 'loader',
			state: 'brand',	// default: primary
			message: '로딩중..'	// default: true
		},

		icons: {
			sort: {
				asc: 'la la-arrow-up',
				desc: 'la la-arrow-down'
			},
			pagination: {
				next: 'la la-angle-right',
				prev: 'la la-angle-left',
				first: 'la la-angle-double-left',
				last: 'la la-angle-double-right',
				more: 'la la-ellipsis-h'
			},
			rowDetail: {
				expand: 'fa fa-caret-down',
				collapse: 'fa fa-caret-right'
			}
		}
	};

	var toolbar = {
		// place pagination and displayInfo blocks according to the array order
		layout: ['pagination', 'info'],

		// toolbar placement can be at top or bottom or both top and bottom repeated
		placement: ['bottom'],  //'top', 'bottom'

		items : {
			// pagination
			pagination: {
				// pagination type(default or scroll)
				type: 'default',

				// number of pages to display by breakpoints
				pages: {
					desktop: {
						layout: 'default',
						pagesNumber: 5,
					},
					tablet: {
						layout: 'default',
						pagesNumber: 3,
					},
					mobile: {
						layout: 'compact',
					},
				},

				// navigation buttons
				navigation: {
					prev: true, // display prev button
					next: true, // display next button
					first: true, // display first button
					last: true, // display last button
					more: false // display more button
				},

				// page size select
				pageSizeSelect: [5, 10, 25, 50], // display dropdown to select pagination size. -1 is used for "ALl" option
			},
			
			// records info
			info: true,
		}
	};

	var detail = {
		title: '하위 목록 보기',	// Load sub table
		content: subTableInit,
	};

	/* Child Column & Search(Filter) Setting */
	var childColumns = new Array();
	childConfig.column.forEach(function(column, index) {

		// Column
		var colObj = new Object();
		colObj.field = column.data;
		colObj.title = column.name;
		// colObj.sortable = true;	// 정렬

		if(!childConfig.order) {
			colObj.sortable = false;
		} else {

			if(childConfig.order.index == index) {
				colObj.sortable = childConfig.order.type;
			}
		}

		if(column.type == 'action') {

			colObj.sortable = false;
			colObj.template = function(row) {

				var url = '';
				if(childConfig.action.list_action_btn.url.indexOf('?') > 0) {
	
					if(row.ent_id) {

						url = childConfig.action.list_action_btn.url + '&key=' + row.id + '&entId=' + row.ent_id;
						if(row.form_id) {
							url += '&formId=' + row.form_id;
						}
					} else {
						url = childConfig.action.list_action_btn.url + '&key=' + row.id;
					}
	
				} else {
	
					if(row.ent_id) {

						url = childConfig.action.list_action_btn.url + '?key=' + row.id + '&entId=' + row.ent_id;
						if(row.form_id) {
							url += '&formId=' + row.form_id;
						}
					} else {
						url = childConfig.action.list_action_btn.url + '?key=' + row.id;
					}
				}
				return '\
					<a href="#" class="btn btn-icon btn-light-success" title="Edit ticket" id="modify" data-toggle="modal" data-target="#ticketModal" data-remote="' + url + '" data-id="' + row.id + '" data-name="' + row.name + '">\
						<i class="la la-edit"></i>\
					</a>\
				';
			}
		}

		if(column.type == 'view' || column.type == 'action') {
			childColumns.push(colObj);
		}
	});

	function subTableInit(event) {

		$('<div/>').attr('key', 'child_data_ajax_' + getUniqueKey(object.id)).appendTo(event.detailCell).KTDatatable({
			data: {
				type: 'remote',
				source: {
					read: {
						url: childConfig.layout.list,
						method: 'POST',
						params: {
							lstId: childObject.id,
							query: event.data
						},
						map: function(raw) {

							var dataSet = raw;
							if (typeof raw.result !== 'undefined') {
							  dataSet = raw.result;
							}
							return dataSet;
						}
					},
				},
				pageSize: 10, // display records per page
				saveState: false,	// localStorage 사용여부
		
				serverPaging: true,	// default: false
				serverFiltering: true,	// default: false
				serverSorting: true,	// default: false
				autoColumns: false	// default: false
			},

			layout: layout,
			toolbar: toolbar,
			translate: translate,

			// columns definition
			columns: childColumns,
		});
	}

	KTDatatableChild.init(data, translate, layout, toolbar, detail, columns);
});
