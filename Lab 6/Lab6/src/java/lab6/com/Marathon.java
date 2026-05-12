package lab6.com;


public class Marathon {
    private String icNo;
    private String name;
    private String category;
    
    public Marathon(){}

    public Marathon(String icNo, String name, String category) {
        this.icNo = icNo;
        this.name = name;
        this.category = category;
    }

    public String getIcNo() {
        return icNo;
    }

    public void setIcNo(String icNo) {
        this.icNo = icNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    
}
