import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any;

@Component({
  selector: 'app-orderdetail',
  templateUrl: './orderdetail.component.html',
  styleUrls: ['./orderdetail.component.css']
})
export class OrderdetailComponent implements OnInit {

  orderdetail: any = {
    data: [],
    totalRecords: 0,
    page: 0,
    size: 5,
    totalPages: 0
  }
  isEdit:boolean=false;

  orderdetails: any = {   // Khoi tao mac dinh cho vui
    orderdetailId: "CTDH100",
    price: 1,
    quantity: 2,
    orderId: "OD01",
    productId: "SPAT01",
    userid: "US01",
    orderdetailDescription: "Hello Xuan Thuan",
  }


  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.searchOrderdetail(1);
  }

  searchOrderdetail(cPage) {
    let x = {
      page: cPage,
      size: 5,
      keyword: ""
    }
    this.http.post('https://localhost:44370/' + 'api/Orderdetail/search-orderdetail', x).subscribe(result => {
      this.orderdetail = result;
     
    }, error => console.error(error));

  }

  searchNext() {
    if (this.orderdetail.page < this.orderdetail.totalPages) {
      let nextPage = this.orderdetail.page + 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Orderdetail/search-orderdetail', x).subscribe(result => {
        this.orderdetail = result;
        
      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang cuối cùng!!");
    }
  }

  searchPrevious() {
    if (this.orderdetail.page > 1) {
      let nextPage = this.orderdetail.page - 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Orderdetail/search-orderdetail', x).subscribe(result => {
        this.orderdetail = result;
       

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang đầu tiên!!");
    }
  }

  openModal(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.orderdetails =
      {
        orderdetailId: "",
        price: 0,
        quantity: 0,
        orderId: "OD01",
        productId: "SPAT01",
        userid: "US01",
        orderdetailDescription: "",
      }
    }
    else {
      this.isEdit = true;
      this.orderdetails = index;
    }
    $('#exampleModal').modal("show");
  }
  addOrderdetail() {
    var x = this.orderdetails;
    this.http.post('https://localhost:44370/' + 'api/Orderdetail/create-orderdetail', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.orderdetails = result;
        this.isEdit = true;
        this.searchOrderdetail(1);
        alert("New Orderdetail have been added successfully!");
      }


    }, error => console.error(error));
  }

  updateOrderdetail() {
    var x = this.orderdetails;
    this.http.post('https://localhost:44370/' + 'api/Orderdetail/update-orderdetail', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.orderdetails = result;
        this.isEdit = true;
        this.searchOrderdetail(1);
        alert("Orderdetail has been successfully updated!");
      }


    }, error => console.error(error));
  }

  deleteOrderdetail(index) {
    var r = confirm("Are you sure to delete this orderdetail?");
    if (r == true) {
      this.orderdetails = this.orderdetail.data[index];
      var x = {id: this.orderdetails.orderdetailId};  // Vi ben code Visual Studio la kieu id.
      this.http.post('https://localhost:44370/' + 'api/Orderdetail/delete-orderdetail', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.searchOrderdetail(1);
          alert("Orderdetail have been deleted successfully!");
        }
        else {
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }

}
