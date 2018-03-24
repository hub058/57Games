package com.game.model; 

/**
 * Created By FeastCoding.
 */
public class User { 
    private Integer id;
    private String name;
    private String pass;
    private Integer status;
    private String phone;
    private String mail;
    private String realname;
    private String idnumber;
    private Integer totalrecharge;

    public Integer getId(){
      return id;
    }
    public void setId(Integer id){
      this.id = id;
    }
    public String getName(){
      return name;
    }
    public void setName(String name){
      this.name = name;
    }
    public String getPass(){
      return pass;
    }
    public void setPass(String pass){
      this.pass = pass;
    }
    public Integer getStatus(){
      return status;
    }
    public void setStatus(Integer status){
      this.status = status;
    }
    public String getPhone(){
      return phone;
    }
    public void setPhone(String phone){
      this.phone = phone;
    }
    public String getMail(){
      return mail;
    }
    public void setMail(String mail){
      this.mail = mail;
    }
    public String getRealname(){
      return realname;
    }
    public void setRealname(String realname){
      this.realname = realname;
    }
    public String getIdnumber(){
      return idnumber;
    }
    public void setIdnumber(String idnumber){
      this.idnumber = idnumber;
    }
    public Integer getTotalrecharge(){
      return totalrecharge;
    }
    public void setTotalrecharge(Integer totalrecharge){
      this.totalrecharge = totalrecharge;
    }

}
