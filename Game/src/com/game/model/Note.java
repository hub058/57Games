package com.game.model; 

/**
 * Created By FeastCoding.
 */
public class Note { 
    private Integer id;
    private String title;
    private String content;
    private String user;
    private String date;

    public Integer getId(){
      return id;
    }
    public void setId(Integer id){
      this.id = id;
    }
    public String getTitle(){
      return title;
    }
    public void setTitle(String title){
      this.title = title;
    }
    public String getContent(){
      return content;
    }
    public void setContent(String content){
      this.content = content;
    }
    public String getUser(){
      return user;
    }
    public void setUser(String user){
      this.user = user;
    }
    public String getDate(){
      return date;
    }
    public void setDate(String date){
      this.date = date;
    }

}
