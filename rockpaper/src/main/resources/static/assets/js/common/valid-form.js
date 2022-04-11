// Class definition
var _Form = function () {

	// Private functions
	var _initForm = function (formId, fields) {
		FormValidation.formValidation(
			document.getElementById(formId),
			{
				fields: fields,
				/* fields: {
					text: {
						validators: {
							notEmpty: {
								message: 'Text is required'
							}
						},
						stringLength: {
							min: 6,
							max: 30,
							message: 'The username must be more than 6 and less than 30 characters long',
						},
						regexp: {
							regexp: /^[a-zA-Z0-9_]+$/,
							message: 'The username can only consist of alphabetical, number and underscore',
						},
					},
					number: {
						validators: {
							notEmpty: {
								message: 'Number is required'
							},
							digits: {
								message: 'The velue is not a valid digits'
							}
						}
					},
				}, */

				plugins: {
					trigger: new FormValidation.plugins.Trigger(),
					// Bootstrap Framework Integration
					bootstrap: new FormValidation.plugins.Bootstrap(),
					// Validate fields when clicking the Submit button
					submitButton: new FormValidation.plugins.SubmitButton(),
					// Submit the form when all fields are valid
					// defaultSubmit: new FormValidation.plugins.DefaultSubmit(),
				}
			}
		).on('core.form.valid', function(event) {
			saveForm();
		});

		$('button[type=button][btn-type=control]').on('click', function(event) {
			saveForm(this);
		});

		var saveForm = function(element) {

			var form = $('#' + formId);

			var nameObject = form.find('input[name="name"]');
			if(nameObject.val().trim() == '') {
				
				nameObject.addClass('is-invalid');
				nameObject.focus();
				return;
			}

			var label = $(element).attr('label');
			if(!label) {

				$('button[type=submit]').each(function(index, button) {
					label = $(button).attr('label');
				});
			}

			if(confirm(label + '하시겠습니까?')) {
				
				$('button[btn-type=control]').each(function(index, button){
					button.setAttribute('disabled', true);
				});
	
				var disabled = form.find(':disabled').removeAttr('disabled');
				var formData = form.serialize();
				disabled.attr('disabled', 'disabled');

				$.post(
					form.attr('action'),
					formData
				).done(function(response, textStatus, xhr) {
	
					// console.log("response", response);
					// console.log("textStatus", textStatus);
					// console.log("xhr", xhr);
					if(response.status == 200) {

						alert('저장되었습니다.');
						refresh();
					} else {
						alert(response.message);
					}
				}).fail(function(response, textStatus, errorThrown) {

					console.log("response", response);
					console.log("textStatus", textStatus);
					console.log("errorThrown", errorThrown);
					alert('response : ' + response + '\n' + 'textStatus : ' + textStatus + '\n' + 'errorThrown : ' + errorThrown);
				});
			}
		}

		$('#deleteBtn').on('click', function(event) {

			if(confirm('삭제하시겠습니까?')) {

				$.ajax({
					url: event.target.getAttribute('remote'),
					method: "DELETE",
					data: {
						key: event.target.value,
						entId: event.target.getAttribute('entId')
					}
				}).done(function (response, textStatus, xhr) {
	
					// console.log("response", response);
					// console.log("textStatus", textStatus);
					// console.log("xhr", xhr);
					if(response.status == 200) {

						alert('삭제되었습니다.');
						refresh();
					} else {
						alert(response.message);
					}
				}).fail(function(response, textStatus, errorThrown){
	
					console.log("response", response);
					console.log("textStatus", textStatus);
					console.log("errorThrown", errorThrown);
					alert('response : ' + response + '\n' + 'textStatus : ' + textStatus + '\n' + 'errorThrown : ' + errorThrown);
				});
			}
		});

		$('#closeBtn').on('click', function(event) {

			if(confirm('창을 닫겠습니까?')) {

				if($('#ticketModal').is(':visible')) {
					$('#ticketModal').modal('hide');
				} else {

					console.log('close');
					window.open('', '_self').close(); 
				}
			}
		});

		$('#cloneBtn').on('click', function(event) {

			if(confirm('복제하시겠습니까?')) {

			}
		});

		var refresh = function() {

			if($('#ticketModal').is(':visible')) {
				$('#ticketModal').modal('hide');
			}

			var result = false;

			try {

				// 일반 List
				if($('#kt_datatable').DataTable()) {
					$('#kt_datatable').DataTable().ajax.reload();
					result = true;
				}
			} catch(E) {
				// window.location.reload();
			}

			try {

				// Child List
				if($('#kt_datatable').KTDatatable()) {
					$('#kt_datatable').KTDatatable().reload();
					result = true;
				}
			} catch(E) {
				// window.location.reload();
			}

			if(!result) {
				window.location.reload();
			}
		}
	}

	return {
		init: function(formId, fields) {
			_initForm(formId, fields);
		}
	};
}();