<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Production Inventory Details</title>
</head>
<body>
    <h1>Production Inventory Details</h1>

    <c:if test="${not empty productionInventoryList}">
        <table>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Status</th>
            </tr>
            <c:forEach var="row" items="${productionInventoryList}">
                <tr>
                    <td>${row.productId}</td>
                    <td>${row.productName}</td>
                    <td>${row.quantity}</td>
                    <td>${row.status}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty productionInventoryList}">
        <p>No production inventory records found.</p>
    </c:if>
</body>
</html>