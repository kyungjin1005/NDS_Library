<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<books>
		<book>
			<book_id><![CDATA[${book.book_id}]]></book_id>
			<title><![CDATA[${book.title}]]></title>
			<registered_date><![CDATA[${book.registered_date}]]></registered_date>
			<pubdate><![CDATA[${book.pubdate}]]></pubdate>
			<author><![CDATA[${book.author}]]></author>
			<publisher><![CDATA[${book.publisher}]]></publisher>
			<image><![CDATA[${book.image}]]></image>
		</book>
</books>