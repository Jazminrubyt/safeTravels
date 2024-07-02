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
<title>Safe Travels</title>
</head>
<body>
	<div class="container text-center bg-dark">
		<h1 class="text-light">Safe Travels</h1>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-info mb-3 " style="max-width:auto;">
				<div class="card-header"> Info</div>
				<div class="card-body">
					<table>
						<thead>
							<tr>
								<th>Expense</th>
								<th>Vendor</th>
								<th>Amount</th>
								<th>Actions:</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="expense" items="${TheExpenses}">
								<tr>
									<td><c:out value="${expense.expense}" /></td>
									<td><c:out value="${expense.vendor}" /></td>
									<td><c:out value="${expense.amount}" /></td>
									<td><a class="btn btn-sm btn-success"
										href="/expense/${expense.id}"> Details </a>
										<form action="/expense/delete/${expense.id}" method="post">
											<input type="hidden" name="_method" value="delete"> 
											<input
												type="submit" class="btn btn-danger btn-sm " value="Delete">
										</form>
										<a class="btn btn-sm btn-warning mb-3"
										href="/expense/${expense.id}/edit"> Edit </a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<h2 class=" text-light">Add an expense</h2>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-info mb-3 " style="max-width: 18rem;">
				<div class="card-header">Fill This Out!</div>
				<div class="card-body">
					<form:form action="/newExpense" method="post" modelAttribute="expense">
						<div>
							<form:label path="expense">Expense</form:label>
							<form:errors class="text-light" path="expense" />
							<form:input class="mb-3" path="expense" />
						</div>
						<div>
							<form:label path="vendor">Vendor</form:label>
							<form:errors class="text-light " path="vendor" />
							<form:input class="mb-3" path="vendor" />
						</div>
						<div>
							<form:label path="amount">Amount</form:label>
							<form:errors class="text-light" path="amount" />
							<form:input type="number" class="mb-3" path="amount" />
						</div>
						
						<input type="submit" class="btn btn-warning mt-3" value="Submit" />
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</body>
</html>