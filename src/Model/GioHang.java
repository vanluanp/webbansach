package Model;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class GioHang {
    private HashMap<String, Item> itemsCart;

    public GioHang() {
        itemsCart = new HashMap<>();
    }

    public HashMap<String, Item> getItemsCart() {
        return itemsCart;
    }

    public void setItemsCart(HashMap<String, Item> itemsCart) {
        this.itemsCart = itemsCart;
    }

    //insert to cart
    public void plusToCart(String key, Item item) {
        boolean bln = itemsCart.containsKey(key);
        if (bln) {
            int quantityOld = item.getSoLuong();
            item.setSoLuong(quantityOld + 1);
            itemsCart.put(item.getSanPham().getMaSach(), item);
        } else {
            itemsCart.put(item.getSanPham().getMaSach(), item);
        }
    }

    //sub to cart
    public void subToCart(String key, Item item) {
        boolean bln = itemsCart.containsKey(key);
        if (bln) {
            if (item.getSoLuong() > 1) {
                int quantityOld = item.getSoLuong();
                item.setSoLuong(quantityOld - 1);
                itemsCart.put(key, item);
            } else {
                itemsCart.remove(key);
            }
        }
    }

    //remove to cart
    public void removeToCart(String key) {
        boolean bln = itemsCart.containsKey(key);
        if (bln) {
            itemsCart.remove(key);
        }
    }

    //count items
    public int countItems() {
        int count = 0;
        count = itemsCart.size();
        return count;
    }

    //total
    public double total() {
        double total = 0;
        for (Map.Entry<String, Item> list : itemsCart.entrySet()) {
            total += (list.getValue().getSoLuong() * list.getValue().getSanPham().getGiaKhuyenMai());
        }
        return total;
    }

}
