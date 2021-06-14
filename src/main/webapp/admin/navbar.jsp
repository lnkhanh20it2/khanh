
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fas fa-book"></i> K-Books
			</h3>
		</div>
		<div class="col-md-6 text-center">
			<form>
				<div class="form-group row search justify-content-center">
					<div class="col-sm-8">
						<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
					</div>
					<button class="btn btn-outline-success rounded-circle " type="submit"><i class="fas fa-search"></i></button>
				</div>
			</form>
		</div>
		<div class="col-md-3 text-right">
			<c:if test="${not empty userobj}">
				<a href="login.jsp" class="btn btn-success mr-3"><i
					class="fas fa-user"></i>${userobj.name}</a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-primary"><i class="fas fa-sign-out-alt"></i>Logout</a>
			</c:if>
			<c:if test="${empty userobj}">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i>Login</a>
				<a href="../register.jsp" class="btn btn-primary"><i
					class="fas fa-user-plus"></i>Register</a>
			</c:if>
		</div>
	</div>
</div>
<!-- Logout modal -->
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>You want logout</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../logout" type="button" class="btn btn-primary">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- end logout -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Home
					<span class="sr-only"></span>
			</a></li>
		</ul>
	</div>
</nav>