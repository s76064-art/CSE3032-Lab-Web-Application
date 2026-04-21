package com;


public class InforBMI {
    private String weight;
    private String height;
    private String BMI;
    private String category;

    public InforBMI(String weight, String height, String BMI, String category) {
        this.weight = weight;
        this.height = height;
        this.BMI = BMI;
        this.category = category;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getBMI() {
        return BMI;
    }

    public void setBMI(String BMI) {
        this.BMI = BMI;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    
}
