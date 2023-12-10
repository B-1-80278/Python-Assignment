public class Invoice {
    String partNumber;
    String partDescription;
    int qauntity;
    double price;

    public Invoice() {
        this.partNumber = "20P40";
        this.partDescription = "Castrol";
        this.qauntity = 1;
        this.price = 12000.0;
    }

    public String getPartNumber() {
        return partNumber;
    }

    public String getPartDescription() {
        return partDescription;
    }

    public int getQauntity() {
        return qauntity;
    }

    public double getPrice() {
        return price;
    }

    public void setPartNumber(String partNumber) {
        this.partNumber = partNumber;
    }

    public void setPartDescription(String partDescription) {
        this.partDescription = partDescription;
    }

    public void setQauntity(int qauntity) {
        if(qauntity>=0) {
            this.qauntity = qauntity;
        }else{
            this.qauntity = 0;
        }
    }


    public void setPrice(double price) {
        if(price>=0) {
            this.price = price;
        }else{
            this.price = 0.0;
        }
    }
        double amount = 0.0;
        void invoiceTest(){
            double amount = (getQauntity() * getPrice());
            System.out.println("Total amount is: "+amount+" for "+partDescription+", Quantity = "+qauntity);
            System.out.println(" and Price per item is= "+price+", part number = "+partNumber);
        }

}
