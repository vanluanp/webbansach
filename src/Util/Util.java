package Util;

public class Util {
    public static String utilAdmin(String s) {
        return "http://localhost:8000/PJ/admin/" + s;
    }

    public static String utilUser(String s) {
        return "http://localhost:8000/PJ/" + s;
    }
}
