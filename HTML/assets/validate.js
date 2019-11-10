/* <![CDATA[ */

/// Jquery validate newsletter
$('#newsletter_form').submit(function () {

	var action = $(this).attr('action');

	$("#message-newsletter").slideUp(750, function () {
		$('#message-newsletter').hide();

		$('#submit-newsletter')
			.after('<i class="icon-spin4 animate-spin loader"></i>')
			.attr('disabled', 'disabled');

		$.post(action, {
				email_newsletter: $('#email_newsletter').val()
			},
			function (data) {
				document.getElementById('message-newsletter').innerHTML = data;
				$('#message-newsletter').slideDown('slow');
				$('#newsletter_form .loader').fadeOut('slow', function () {
					$(this).remove()
				});
				$('#submit-newsletter').removeAttr('disabled');
				if (data.match('success') != null) $('#newsletter_form').slideUp('slow');

			}
		);

	});
	return false;
});


// Jquery validate form contact
$('#contactform').submit(function () {

	var action = $(this).attr('action');

	$("#message-contact").slideUp(750, function () {
		$('#message-contact').hide();

		$('#submit-contact')
			.after('<i class="icon-spin4 animate-spin loader"></i>')
			.attr('disabled', 'disabled');

		$.post(action, {
				name_contact: $('#name_contact').val(),
				lastname_contact: $('#lastname_contact').val(),
				email_contact: $('#email_contact').val(),
				phone_contact: $('#phone_contact').val(),
				message_contact: $('#message_contact').val(),
				verify_contact: $('#verify_contact').val()
			},
			function (data) {
				document.getElementById('message-contact').innerHTML = data;
				$('#message-contact').slideDown('slow');
				$('#contactform .loader').fadeOut('slow', function () {
					$(this).remove()
				});
				$('#submit-contact').removeAttr('disabled');
				if (data.match('success') != null) $('#contactform').slideUp('slow');

			}
		);

	});
	return false;
});

/// Jquery validate support form
$('#support').submit(function () {

	var action = $(this).attr('action');

	$("#message-support").slideUp(750, function () {
		$('#message-support').hide();

		$('#submit-support')
			.after('<i class="icon-spin4 animate-spin loader"></i>')
			.attr('disabled', 'disabled');

		$.post(action, {
				name_support: $('#name_support').val(),
				email_support: $('#email_support').val(),
				message_support: $('#message_support').val(),
				verify_support: $('#verify_support').val()
			},
			function (data) {
				document.getElementById('message-support').innerHTML = data;
				$('#message-support').slideDown('slow');
				$('#support .loader').fadeOut('slow', function () {
					$(this).remove()
				});
				$('#submit-support').removeAttr('disabled');
				if (data.match('success') != null) $('#support').slideUp('slow');

			}
		);

	});
	return false;
});

/* ]]> */