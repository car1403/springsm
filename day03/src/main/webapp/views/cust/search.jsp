<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>Cust Search Page</h2>
  <form>
    <div class="form-group">
      <div class="row">
        <div class="col-sm-2">
          <h5>Search</h5>
        </div>
        <div class="col-sm-3">
          <select class="form-control" id="sel1">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
          </select>
        </div>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="usr">
        </div>
        <div class="col-sm-3">
          <button type="submit" class="btn btn-primary">Search</button>
        </div>
      </div>
    </div>
  </form>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Age</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="c" items="${custs}">
        <tr>
          <td><a href="/cust/detail?id=${c.custId}">${c.custId}</a></td>
          <td>${c.custPwd}</td>
          <td>${c.custName}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>