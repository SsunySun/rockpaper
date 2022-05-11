"use strict";

var KTCalendarListView = function() {

    return {
        //main function to initiate the module
        init: function() {

            var getEventSources = function() {

                var extraParams = new Object();
                extraParams.sqlId = 'EMP_WORK_LIST';
                extraParams.dpt_id = $('#dpt_id').val();
                if($('#charge_emp_name').val()) {
                    extraParams.emp_name = $('#charge_emp_name').val();
                }

                var sources = [];
                sources.push({
                    url: '/api/common/calendarList',
                    method: 'POST',
                    extraParams,
                    failure: function() {
                        alert('there was an error while fetching events!');
                    }
                });

                return sources;
            }

            var todayDate = moment().startOf('day');
            var TODAY = todayDate.format('YYYY-MM-DD');

            var calendarEl = document.getElementById('kt_calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],

                locale: 'ko',

                isRTL: KTUtil.isRTL(),
                header: {
                    left: 'prev,next, today',
                    center: 'title',
                    right: 'dayGridMonth,listMonth,listDay'   // dayGridMonth,timeGridWeek,timeGridDay,listWeek,listMonth,listDay
                },

                height: 1800,
                contentHeight: 1750,
                aspectRatio: 10,  // see: https://fullcalendar.io/docs/aspectRatio
                buttonText: {
                    today: '오늘'
                },
                allDayText: '종일',
                noEventsMessage: '일정이 없습니다.',
                eventLimitText: '더보기',

                allDaySlot: false,
                views: {
                    dayGridMonth: { buttonText: '달력' },
                    listMonth: { buttonText: '월별목록' },
                    listDay: { buttonText: '일별목록' }
                },

                defaultView: 'dayGridMonth',
                defaultDate: TODAY,

                businessHours: true,
                editable: false,
                eventLimit: true, // allow "more" link when too many events
                navLinks: true,
                eventSources: getEventSources(),

                eventRender: function(info) {

                    var element = $(info.el);
                    if (info.event.extendedProps && info.event.extendedProps.description) {

                        if (element.hasClass('fc-day-grid-event')) {
                            element.data('content', info.event.extendedProps.description);
                            element.data('placement', 'top');
                            KTApp.initPopover(element);
                        } else if (element.hasClass('fc-time-grid-event')) {

                            element.find('.fc-title').append('<div class="fc-description">' + info.event.extendedProps.description + '</div>');
                        } else if (element.find('.fc-list-item-title').lenght !== 0) {

                            element.find('.fc-list-item-title').append('<div class="fc-description">' + info.event.extendedProps.description + '</div>');
                        }
                    }
                },

                dateClick: function(info) {
                    // console.log(info)
                    // alert(info + ' a day has been clicked!');
                },

                eventClick: function(info) {
                    showDialog(info);
                },

                eventDataTransform: function(eventData) {
                    // console.log('eventDataTransform : ' + eventData);
                }
            });

            calendar.render();

            var showDialog = function(info) {

                $('#calendarTicketModal').modal('show');

                var id = info.event.id;
                var name = info.event.title;
                var remote = '/common/modal/form?entId=WOR&key=' + info.event.id;

                var modal = $('#calendarTicketModal');
                if(id && name) {
                    modal.find('.modal-title').text(name + '(' + id + ')');
                } else if(name) {
                    modal.find('.modal-title').text(name);
                }
        
                modal.find('.modal-body').load(remote, function() {});
            }

            $('#calendarTicketModal').on('hide.bs.modal', function(event) {

                var modal = $(this);
                modal.find('.modal-body').html('');
            });

            $('#dpt_id').on('change', function() {

                $('#charge_emp_name').val('');
                search();
            });

            $('#searchBtn').on('click', function() {
                search();
            });

            $('#kt_calendar_external_events').on('click', '.engineer', function() {
                $('#charge_emp_name').val($(this).text());
                search();
            });
        

            var search = function() {

                var params = new Array();
                params.push({name: 'dpt_id', value: $('#dpt_id').val()});
                params.push({name: 'charge_emp_name', value: $('#charge_emp_name').val()});

                $("#calendar-fragment").load( 
                    "/common/calendarByList",
                    params,
                    function(response, textStatus, xhr) {

                        if(xhr.status == 200) {
                            
                            // console.log("response", response);
                            // console.log("textStatus", textStatus);
                            // console.log("xhr", xhr);

                            calendar.getEventSources().forEach(eventSource => {
                                eventSource.remove();
                            });
            
                            // get currently selected sources
                            var sources = getEventSources();
            
                            // add each new source to the calendar
                            sources.forEach(eventSource => {
                                calendar.addEventSource(eventSource);
                            });
                        } else {

                            console.log("response", response);
                            console.log("textStatus", textStatus);
                            console.log("xhr", xhr);
                            alert('message : ' + response.message + '\n' + 'result : ' + response.result);
                        }
                });
            }
        }
    };
}();

jQuery(document).ready(function() {
    KTCalendarListView.init();
});
