package com.nds.library.main;
import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


public class InterparkParse {
   public static String getContent(Element element, String tagName)
   {
       NodeList list = element.getElementsByTagName(tagName);
       Element cElement = (Element)list.item(0);
       
       if(cElement.getFirstChild()!=null){
         return cElement.getFirstChild().getNodeValue();
       }else{
         return "";
       }
   }
   
   public ArrayList<Borrowing> parse(String uri)
   {
      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
      ArrayList<Borrowing> bookList = new ArrayList<Borrowing>();
      try
      {
         DocumentBuilder builder = dbf.newDocumentBuilder();
         Document doc = builder.parse(uri);
         Element root = doc.getDocumentElement();
         NodeList list = root.getElementsByTagName("item");
         
         
          for(int i=0; i< 3;i++){
            Element element = (Element)list.item(i);
            
            Borrowing book = new Borrowing();
            book.setTitle(getContent(element, "title"));
            book.setImage(getContent(element, "coverSmallUrl"));
            book.setRegistered_date(getContent(element, "pubDate"));
            book.setAuthor(getContent(element,"author"));
            book.setPublisher(getContent(element, "publisher"));
         /*   book.setAuthor(getContent(element, "author"));
            book.setPubdate(getContent(element, "pubdate"));
            book.setIsbn(getContent(element, "isbn"));
            book.setPublisher
            (getContent(element, "publisher"));
            book.setExplanation(getContent(element, "description"));*/
            
            bookList.add(book);
         }
      }
      catch (ParserConfigurationException e){ e.printStackTrace(); }
      catch (SAXException e){ e.printStackTrace(); }
      catch(IOException e){ e.printStackTrace(); }
      
      return bookList;
   }
}