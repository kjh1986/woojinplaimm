<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="url" value="${param.url}">
	<c:param name="type" value="${type}"/>
	<c:param name="errors" value="${errors}"/>
	<c:param name="redirect" value="${redirect}"/>
</c:url> 
<c:redirect url="${url}"/>