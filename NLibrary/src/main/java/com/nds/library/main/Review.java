package com.nds.library.main;

public class Review {

   private String content, reviewed_date, modified_date, read_count, name, rownum, review_id, user_id, information_id,
         star, blind, isbn;

   
   public String getIsbn() {
      return isbn;
   }

   public void setIsbn(String isbn) {
      this.isbn = isbn;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getReviewed_date() {
      return reviewed_date;
   }

   public void setReviewed_date(String reviewed_date) {
      this.reviewed_date = reviewed_date;
   }

   public String getModified_date() {
      return modified_date;
   }

   public void setModified_date(String modified_date) {
      this.modified_date = modified_date;
   }

   public String getRead_count() {
      return read_count;
   }

   public void setRead_count(String read_count) {
      this.read_count = read_count;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getRownum() {
      return rownum;
   }

   public void setRownum(String rownum) {
      this.rownum = rownum;
   }

   public String getReview_id() {
      return review_id;
   }

   public void setReview_id(String review_id) {
      this.review_id = review_id;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getInformation_id() {
      return information_id;
   }

   public void setInformation_id(String information_id) {
      this.information_id = information_id;
   }

   public String getStar() {
      return star;
   }

   public void setStar(String star) {
      this.star = star;
   }

   public String getBlind() {
      return blind;
   }

   public void setBlind(String blind) {
      this.blind = blind;
   }

}