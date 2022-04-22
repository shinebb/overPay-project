package dao;


import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
	//상품 상세정보 표시하기
	//통합 저장소 컬렉션 리스트
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	   
	public static ProductRepository getInstance() {
	    return instance;
	}

	
	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 6s", 800000);
		phone.setDescription("4.7-inch, 1334X750 Renina HD display, "
												+ "8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New"); //신상품
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("P1235", "LG PC", 1500000);
		notebook.setDescription("13.3-inch, IPS LED display, " + "5rd Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setCondition("Refurbished"); //재생품
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
		tablet.setDescription("212.8*125.6*6.6mm. Super AMOLED display, " + "Octa-Core processor");
		tablet.setCategory("tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old"); //중고품
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	} //객체 타입의 변수, 물품 리스트를 가져옴
	
	//상품 상세 정보를 가져오는 메소드 추가함
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)){
				productById = product;
				break;
			} //listOfProduct에 저장된 모든 상품목록에서 상품 아이디와 일치하는 상품을
		} //가져오는 getProductId() 메소드를 작성한다.
		return productById;
	}
	
	   public void addProduct(Product product) {
		      listOfProducts.add(product);
		   }

}