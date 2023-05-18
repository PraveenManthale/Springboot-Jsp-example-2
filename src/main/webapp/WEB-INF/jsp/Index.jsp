<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.c
ss"
rel="stylesheet"
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuC
OmLASjC"
crossorigin="anonymous">
</head>
<body style="background-color: #f0f1f2;">
<!-- Start Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
<div class="container-fluid">
<a class="navbar-brand" href="#">Products System</a>
<button class="navbar-toggler" type="button"
data-bs-toggle="collapse"

data-bs-target="#navbarSupportedContent"

aria-controls="navbarSupportedContent"

aria-expanded="false"

aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse"

id="navbarSupportedContent">

<ul class="navbar-nav me-auto mb-2 mb-lg-0">
<li class="nav-item"><a class="nav-link

active"

aria-current="page"

href="/">Home</a></li>

<li class="nav-item"><a class="nav-link"

href="#">Link</a></li>
</ul>
<form class="d-flex">
<input class="form-control me-2"

type="search" placeholder="Search"

aria-label="Search">
<button class="btn btn-outline-success"

type="submit">Search</button>
</form>
</div>
</div>
</nav>
<!-- End Navbar -->
<div class="container p-5">
<div class="row">
<div class="col-md-8 offset-md-2">
<div class="card">
<div th:if="${session.msg}">
<h5 class="text-center text-sucess"

th:text="${session.msg}"></h5>

</div>
<div class="card-header fs-3 text-center">
<a href="load_form"

class="btn-btn-primary">Add Product</a>
</div>
<div class="card-body">
<table class="table">
<thead>
<tr>
<th

scope="col">Id</th>

<th

scope="col">Name</th>

<th

scope="col">Description</th>

<th

scope="col">Price</th>

<th

scope="col">Quantity</th>

<th

scope="col">Action</th>

</tr>
</thead>
<tbody>
<tr th:each="p :

${all_products}">

<th

scope="row">[[${p.id}]]</th>
<td>[[${p.productName}]]</td>
<td>[[${p.decription}]]</td>
<td>[[${p.price}]]</td>
<td>[[${p.quantity}]]</td>

<td><a

th:href="@{'/edit_form/'+${p.id}}"

class="btn

btn-sm btn-primary">Edit</a> <a
th:href="@{'/delete/'+${p.id}}" class="btn btn-sm btn-danger">Delete</a>

</td>
</tr>
</tbody>
</table>
</div>
<div class="card-footer">
<div class="row">
<div class="col-md-6">
<p>Total Elements :

[[${totalElements}]]</p>

</div>
<div class="col-md-6">
<nav aria-label="Page

navigation example">

<ul

class="pagination">

<li
th:classappend="${pageNo==0} ? 'disabled' : '' " class="page-item">
<a
class="page-link" th:href="@{'/page/'+${pageNo-1}}">Previous</a></li>
<li th:each="i
: ${#numbers.sequence(1,totalPage)}" th:classappend="${pageNo+1==i} ?
'active' : '' " class="page-item">

<a
class="page-link" th:href="@{'/page/'+${i-1}}">[[${i}]]</a></li>
<li
th:classappend="${pageNo+1==totalPage} ? 'disabled' : '' "
class="page-item">

<a
class="page-link" th:href="@{'/page/'+${pageNo+1}}">Next</a></li>
</ul>
</nav>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.
min.js"
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tW
tIaxVXM"

crossorigin="anonymous"></script>

</body>
</html>