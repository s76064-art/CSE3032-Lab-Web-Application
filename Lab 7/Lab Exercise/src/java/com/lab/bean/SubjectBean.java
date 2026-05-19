package com.lab.bean;

public class SubjectBean {

    private int id;
    private String subjectName;
    private String matricNo;

    public SubjectBean() {
    }
    public SubjectBean(int id, String subjectName, String matricNo) {
        this.id = id;
        this.subjectName = subjectName;
        this.matricNo = matricNo;
    }
    

    public String getMatricNo() {
        return matricNo;
    }

    public void setMatricNo(String matricNo) {
        this.matricNo = matricNo;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
