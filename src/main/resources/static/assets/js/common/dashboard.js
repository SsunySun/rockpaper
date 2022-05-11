"use strict";

var KTCalendarListView = function() {

    return {
        //main function to initiate the module
        init: function() {

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
                    right: 'dayGridMonth,listMonth'   // dayGridMonth,timeGridWeek,timeGridDay,listWeek,listMonth,listDay
                },

                height: 800,
                contentHeight: 750,
                aspectRatio: 3,  // see: https://fullcalendar.io/docs/aspectRatio
                buttonText: {
                    today: '오늘'
                },
                allDayText: '종일',
                noEventsMessage: '일정이 없습니다.',
                eventLimitText: '더보기',

                allDaySlot: false,
                views: {
                    dayGridMonth: { buttonText: '달력' },
                    listMonth: { buttonText: '일정목록' }
                },

                defaultView: 'dayGridMonth',
                defaultDate: TODAY,

                businessHours: true,
                editable: false,
                eventLimit: true, // allow "more" link when too many events
                navLinks: false,
                eventSources: [

                    // your event source
                    {
                        url: '/api/common/sqlList',
                        method: 'POST',
                        extraParams: {
                            sqlId: 'TODO_COMP_LIST'
                        },
                        failure: function() {
                            alert('there was an error while fetching events!');
                        }
                    },
                    {
                        url: '/api/common/sqlList',
                        method: 'POST',
                        extraParams: {
                            sqlId: 'TODO_PROC_LIST'
                        },
                        failure: function() {
                            alert('there was an error while fetching events!');
                        }
                    },
                    {
                        url: '/api/common/sqlList',
                        method: 'POST',
                        extraParams: {
                            sqlId: 'TODO_HOLIDAY_LIST'
                        },
                        failure: function() {
                            alert('there was an error while fetching events!');
                        }
                    },
                    {
                        url: '/api/common/sqlList',
                        method: 'POST',
                        extraParams: {
                            sqlId: 'TODO_VACATION_LIST'
                        },
                        failure: function() {
                            alert('there was an error while fetching events!');
                        }
                    }
                    // any other sources...
                ],

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

                    if(info.event.id) {
                        showDialog(info);
                    }
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
                var entId = info.event.extendedProps.ent_id;
                var formId = info.event.extendedProps.form_id;
                var remote = '/common/modal/form?entId=' + entId + '&key=' + info.event.id;
                if(formId) {
                    remote += '&formId=' + formId;
                }

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
        }
    };
}();

jQuery(document).ready(function() {
    KTCalendarListView.init();
});
