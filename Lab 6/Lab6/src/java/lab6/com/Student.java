
package lab6.com;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Student {
    private String stuNo;
    private String name;
    private String program;
    
    public Student(){}

    public Student(String stuNo, String name, String program) {
        this.stuNo = stuNo;
        this.name = name;
        this.program = program;
    }

    public String getStuNo() {
        return stuNo;
    }

    public void setStuNo(String stuNo) {
        Pattern pt = Pattern.compile("[A-Z0-9]+");
        Matcher mt = pt.matcher(stuNo);
        if (mt.matches()){
            this.stuNo = stuNo;
        }else{
            throw new IllegalArgumentException("Invalid Student ID: " + stuNo + ". Only uppercase letters and numbers are allowed.");
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }
    
}
