<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<books>
		<book>
			<req_don_id><![CDATA[${book.req_don_id}]]></req_don_id>
			<name><![CDATA[${book.name}]]></name>
			<registered_date><![CDATA[${book.registered_date}]]></registered_date>
			<pubdate><![CDATA[${book.pubdate}]]></pubdate>
			<isbn><![CDATA[${book.isbn}]]></isbn>
			<title><![CDATA[${book.title}]]></title>
			<author><![CDATA[${book.author}]]></author>
			<publisher><![CDATA[${book.publisher}]]></publisher>
			<image><![CDATA[${book.image}]]></image>
			<user_comment><![CDATA[${book.user_comment}]]></user_comment>
		</book>
</books>