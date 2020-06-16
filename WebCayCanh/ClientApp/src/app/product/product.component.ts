import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any;

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

  product: any = {
    data: [],
    totalRecords: 0,
    page: 0,
    size: 5,
    totalPages: 0
  }
  isEdit:boolean=false;

  products: any = {   // Khoi tao mac dinh cho vui
    productId: "SP100",
    productName: "Nguyen Xuan Thuan",
    amount: 0,
    amountRemaining: 0,
    oldPrice: 0,
    productImage: null,
    manufacturerId: "PH01",
    categoryId: "LC01",
    productDescription: "Hello Thuan Lovely"
  }

 
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) {

  }

  ngOnInit() {
    this.searchProduct(1);
  }

  searchProduct(cPage) {
    let x = {
      page: cPage,
      size: 5,
      keyword: ""
    }
    this.http.post('https://localhost:44370/' + 'api/Product/search-product', x).subscribe(result => {
      this.product = result;
      //this.product = this.product.data;


    }, error => console.error(error));

  }

  searchNext() {
    if (this.product.page < this.product.totalPages) {
      let nextPage = this.product.page + 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Product/search-product', x).subscribe(result => {
        this.product = result;
        //this.product = this.product.data;

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang cuối cùng!!");
    }
  }

  searchPrevious() {
    if (this.product.page > 1) {
      let nextPage = this.product.page - 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Product/search-product', x).subscribe(result => {
        this.product = result;
        //this.product = this.product.data;

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang đầu tiên!!");
    }
  }

  openModal(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.products =
      {
        productId: "",
        productName: "",
        amount: 0,
        amountRemaining: 0,
        oldPrice: 0,
        productImage: null,
        manufacturerId: "PH01",
        categoryId: "LC01",
        productDescription: ""
      }
    }
    else {
      this.isEdit = true;
      this.products = index;
    }
    $('#exampleModal').modal("show");
  }
  
  addProduct() {
    var x = this.products;
    this.http.post('https://localhost:44370/' + 'api/Product/create-product', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.products = result;
        this.isEdit = true;
        this.searchProduct(1);
        alert("New Product have been added successfully!");
      }


    }, error => console.error(error));
  }

  updateProduct() {
    var x = this.products;
    this.http.post('https://localhost:44370/' + 'api/Product/update-product', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.products = result;
        this.isEdit = true;
        this.searchProduct(1);
        alert("Product has been successfully updated!");
      }


    }, error => console.error(error));
  }

  deleteProduct(index) {
    var r = confirm("Are you sure to delete this product?");
    if (r == true) {
      this.products = this.product.data[index];
      var x = {id: this.products.productId};  // Vi ben code Visual Studio la kieu id.
      this.http.post('https://localhost:44370/' + 'api/Product/delete-product', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.searchProduct(1);
          alert("Product have been deleted successfully!");
        }
        else {
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }

}
