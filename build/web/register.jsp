<%@page import="blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Sign Up</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
     <%@include file="navbar.jsp" %>
      <br>

<div class="container-fluid">

	<h2>Sign Up</h2>

	<form action="RegisterServlet" method="post">
              <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                %>
                <div class="alert <%= m.getCssClass() %>" role="alert">
                    <%= m.getContent() %>
                </div> 


                <%        
                        session.removeAttribute("msg");
                    }
                %>
		<div class="form-group">
			<label for="username">Username:</label>
			<input type="text" class="form-control" id="username" name="username">
		</div>

		<div class="form-group">
			<label for="email">Email:</label>
			<input type="email" class="form-control" id="email" name="email">
		</div>

		<div class="form-group">
			<label for="password">Password:</label>
			<input type="password" class="form-control" id="password" name="password">
		</div>

		<div class="form-group">
			<label for="gender">Gender:</label>
			<select class="form-control" id="gender" name="gender">
				<option value="male">Male</option>
				<option value="female">Female</option>
				<option value="other">Other</option>
			</select>
		</div>

		<div class="form-group">
			<label for="textbox">Text Box:</label>
			<textarea class="form-control" id="textbox" name="textbox" rows="3"></textarea>
		</div>

		<div class="form-group form-check">
			<label class="form-check-label">
				<input class="form-check-input" type="checkbox" name="agree" required> I agree to the terms and conditions.
			</label>
		</div>

		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

</div>

</body>
</html>
