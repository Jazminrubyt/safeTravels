<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Expense Info</title>
</head>
<body>
	<div class="container bg-dark text-center text-light">
		<a class="nav-link  ms-auto" href="/">Home</a>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-info mb-3 " style="max-width: 18rem;">
				<div class="card-header">Expenses</div>
				<div class="card-body">
					<h1>
						Expenses:
						<c:out value="${expense.expense}" />
					</h1>
					<h1>
						Vendor:
						<c:out value="${expense.vendor}" />
					</h1>
					<h1>
						Amount:
						<c:out value="${expense.amount}" />
					</h1>
				</div>
			</div>
		</div>
	</div>
	

	
</body>
</html>