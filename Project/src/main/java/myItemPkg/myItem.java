package myItemPkg;

import java.util.Vector;

import Products.ProductsBean;
import Products.ProductsDao;

public class myItem {
	private Vector<ProductsBean> plist;
	
	public myItem() {
		plist = new Vector<ProductsBean>();
	}
	
	public void addItem(int pnum, int pcount) throws Exception {
		
		ProductsBean pb = new ProductsBean();
		ProductsDao pdao = ProductsDao.getInstance();
		
		pb = pdao.updateSelProduct(pnum);
		
		for(int i=0;i<plist.size();i++) {
			int prodpnum = plist.get(i).getPnum();
			if(prodpnum == pnum) {
				int prodpqty = plist.get(i).getPqty();
				plist.get(i).setPqty(prodpqty+pcount);
				return;
			}
		}
		pb.setPqty(pcount);
		plist.add(pb);
		
		for(int i=0;i<plist.size();i++) {
			
		}
	}
	public Vector<ProductsBean> allitemList(){
		return plist;
	}
	
	public void updateItem(int pnum, int pcount) {
		
		for(ProductsBean pb : plist) {
			if(pb.getPnum() == pnum) {
				if(pcount == 0) {
				plist.removeElement(pb);
				break;
			}else {
				pb.setPqty(pcount);
				break;
			}
		}
	}
}
	
	public void removeAll() {
		plist.removeAllElements();
	}
	
	public void deleteItem(int pnum) {
		for(ProductsBean pb : plist) {
			if(pb.getPnum() == pnum) {
				plist.removeElement(pb);
				break;
			}
		}
	}
	
}
