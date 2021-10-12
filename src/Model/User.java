package Model;

public class User {
    private String maTK;
    private String name;
    private String userName;
    private String password;
    private int quyen;
    private int status;
    private String phone;

    public User() {
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public User(String maTK, String name, String userName, String password, int quyen, int status, String phone) {
        this.maTK = maTK;
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.quyen = quyen;
        this.status = status;
        this.phone = phone;
    }

    public User(String maTK, String name, String userName, String password, int quyen, int status) {
        this.maTK = maTK;
        this.name = name;
        this.userName = userName;
        this.password = password;
        this.quyen = quyen;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMaTK() {
        return maTK;
    }

    public void setMaTK(String maTK) {
        this.maTK = maTK;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getQuyen() {
        return quyen;
    }

    public void setQuyen(int quyen) {
        this.quyen = quyen;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
