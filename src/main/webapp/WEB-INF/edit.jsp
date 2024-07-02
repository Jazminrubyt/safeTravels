<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
	<div class="container text-center bg-dark">
		<h1 class="text-light">EDIT</h1>
		<a class="nav-link text-light ms-auto" href="/">Home</a>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-info mb-3 " style="max-width:auto;">
				<div class="card-header"> Edit Expense Info</div>
				<div class="card-body">
					<form:form action="/expense/${expense.id}/update" method="post"
						modelAttribute="expense">
						<input type="hidden" name="_method" value="put"> 
						<div>
							<form:label path="expense">expense</form:label>
							<form:errors class="text-light" path="expense" />
							<form:input path="expense" />
						</div>
						<div>
							<form:label path="vendor">Vendor</form:label>
							<form:errors class="text-light" path="vendor" />
							<form:input path="vendor" />
						</div>
						<div>
							<form:label path="amount">Amount</form:label>
							<form:errors class="text-light" path="amount" />
							<form:input type="number" path="amount" />
						</div>
						<input type="submit" class="btn btn-warning mt-3" value="Submit" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>