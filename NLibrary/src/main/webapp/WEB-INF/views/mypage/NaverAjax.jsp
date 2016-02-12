<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<books>
	<c:forEach var="book" items="${bookList}">
		<book>
			<title><![CDATA[${book.title}]]></title>
			<image><![CDATA[${book.image}]]></image>
			<isbn><![CDATA[${book.isbn}]]></isbn>
			<pubdate><![CDATA[${book.pubdate}]]></pubdate>
			<publisher><![CDATA[${book.publisher}]]></publisher>
			<author><![CDATA[${book.author}]]></author>
		</book>
	</c:forEach>
</books>

