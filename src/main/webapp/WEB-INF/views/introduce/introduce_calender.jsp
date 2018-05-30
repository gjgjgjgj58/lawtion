
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta charset='utf-8' />
<link rel='stylesheet' type='text/css' href='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.css' />
<script src='/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<script type='text/javascript' src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery.js'></script>
<script type='text/javascript' src='http://www.blueb.co.kr/data/201010/IJ12872423858253/jquery-ui-custom.js'></script>
<script type='text/javascript' src='http://www.blueb.co.kr/data/201010/IJ12872423858253/fullcalendar.min.js'></script>
<link href='/releases/fullcalendar/3.9.0/fullcalendar.min.css' rel='stylesheet' />
<link href='/releases/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print' />
<script type='text/javascript'>
/*$(document).ready(function() {

	  $('#calendar').fullCalendar({
	    defaultView: 'month',

	    header: {
	      center: 'addEventButton'
	    },

	    customButtons: {
	      addEventButton: {
	        text: 'add event',
	        click: function() {
	          var dateStr = prompt('Enter a date in YYYY-MM-DD format');
	          var date = moment(dateStr);

	          if (date.isValid()) {
	            $('#calendar').fullCalendar('renderEvent', {
	              title: 'dynamic event',
	              start: date,
	              allDay: true
	            });
	            alert('Great. Now, update your database');
	          } else {
	            alert('Invalid date.');
	          }
	        }
	      }
	    }
	  });

	});*/
	
	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			//defaultView:'month',
			
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			
		
			});
			events: [
				{
					title: '정윤주 님',
					start: new Date(y, m, 1)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			]
		
		
	});

</script>
 <style type='text/css'>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 500px;
		margin: 0 auto;
		}

</style>
<title>Calender</title>
</head>
<body>
<div id='calendar'></div>
</body>
</html> 



