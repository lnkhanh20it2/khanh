<%@page import="java.util.List"%>
<%@page import="com.leanjavaweb.model.User"%>
<%@page import="com.leanjavaweb.DB.DBConnect"%>
<%@page import="com.leanjavaweb.Dao.CartImpl"%>
<%@page import="com.leanjavaweb.model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
			<c:remove var="succMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger" role="alert">${failedMsg }</div>
			<c:remove var="failedMsg" scope="session"/>
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartImpl dao = new CartImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice=0.0;
								for (Cart c : cart) {
									totalPrice=c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor() %></td>
									<td><%=c.getPrice()%></td>
									<td> 
									<a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>" class="btn btn-danger">Remove</a>
									</td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Details dor Order</h3>
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" value="<%=u.getName()%>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input
										type="email" class="form-control" id="inputPassword4" value="<%=u.getEmail()%>" readonly="readonly" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone number</label> <input type="number"
										class="form-control" id="inputEmail4" value="<%=u.getPassword()%>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input
										type="text" class="form-control" id="inputPassword4" >
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input
										type="text" class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-group">
									<label>Payment Mode</label> 
									<select class="form-control">
									<option>--Select--</option>
									<option>Payment on delivery</option>
									</select>
								</div>
								<div class="text-center">
									<button class="btn btn-warning">Order Now</button>
										<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>