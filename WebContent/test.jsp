<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function check() 
	{
	  var date1 = new Date(document.getElementById('checkin').value);
	  var date2 = new Date(document.getElementById('checkout').value);
	  var diff = Math.abs(date2.getTime() - date1.getTime());
	  var noofdays = Math.ceil(diff / (1000 * 3600 * 24));  
	  if(date1  > date2)
	  { 
		alert("Check-out date must be after check-in date!")
	  }
	  else 
	  {
		alert(noofdays);
	  }
	}		
</script>
</head>
<body>
<form>
	<fieldset>
	  <legend>test</legend>
			First Name: <br>
			<input type="text" name="firstname" size="45" pattern="[A-Za-z]+" title="Alphabet characters only." required>
			<br><br>
			Last Name: <br>
			<input type="text" name="lastname" size="45" pattern="[A-Za-z]+" title="Alphabet characters only." required>
			<br><br>
			Street Address: <br>
			<input type="text" name="street" size="45" pattern="[A-Za-z0-9 ]+" title="Alphabet characters and numbers only." required>
			<br><br>
			City: <br>
			<input type="text" name="city" size="45" pattern="[A-Za-z ]+" title="Alphabet characters only." required>
			<br><br>
			State: <br>
			<input list="states" name="state" size="45" required>
				  <datalist id="states">
						<option value="AL">Alabama</option>
						<option value="AK">Alaska</option>
						<option value="AZ">Arizona</option>
						<option value="AR">Arkansas</option>
						<option value="CA">California</option>
						<option value="CO">Colorado</option>
						<option value="CT">Connecticut</option>
						<option value="DE">Delaware</option>
					</datalist>
			<br><br>
			Zip Code: <br>
			<input type="text" name="zipcode" size="45" pattern="[0-9]+" title="Numbers only." required>
			<br><br>
			Phone Number: <br>
			<input type="text" name="phone" size="45" pattern="[0-9-]+" title="Numbers only." required>
			<br><br>
			E-mail: <br>
			<input type="email" name="email" size="45" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
			<br><br>
			Check-In Date:<br>
			<input type="date" id="checkin" name="checkin" required>
			<br><br>
			Check-Out Date:<br>
			<input type="date" id="checkout" name="checkout" required>
			<br><br>
			Room:<br>
			<input list="rooms" name="room" size="16" required>
				<datalist id="rooms">
					<option value="Standard ($50/night)">
					<option value="Queen ($75/night)">
					<option value="King ($100/night)">
					<option value="Business ($125/night)">
					<option value="Deluxe Suite ($150/night)">
				</datalist>
			<br><br>
			<button type="submit" onclick="check()">Submit</button>
			</fieldset>
	  </form>
</body>
</html>