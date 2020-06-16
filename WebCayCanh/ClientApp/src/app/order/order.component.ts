import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any;

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.css']
})
export class OrderComponent implements OnInit {

  order: any = {
    data: [],
    totalRecords: 0,
    page: 0,
    size: 5,
    totalPages: 0
  }
  isEdit:boolean=false;

  orders: any = {   // Khoi tao mac dinh cho vui
    orderId: "OD100",
    orderDate: "2019-08-03 03:45:05.000",
    orderNumber: 1,
    customerId: "KH01",
    orderDescription: "Hello Xuân Thuận"
  }



  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }


  ngOnInit() {
    this.searchOrder(1);
  }

  searchOrder(cPage) {
    let x = {
      page: cPage,
      size: 5,
      keyword: ""
    }
    this.http.post('https://localhost:44370/' + 'api/Order/search-order', x).subscribe(result => {
      this.order = result;



    }, error => console.error(error));

  }

  searchNext() {
    if (this.order.page < this.order.totalPages) {
      let nextPage = this.order.page + 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Order/search-order', x).subscribe(result => {
        this.order = result;
       

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang cuối cùng!!");
    }
  }

  searchPrevious() {
    if (this.order.page > 1) {
      let nextPage = this.order.page - 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Order/search-order', x).subscribe(result => {
        this.order = result;
        

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang đầu tiên!!");
    }
  }

  openModal(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.orders =
      {
        orderId: "",
        orderDate: "",
        orderNumber:0,
        customerId: "KH01",
        orderDescription: ""
      }
    }
    else {
      this.isEdit = true;
      this.orders = index;
    }
    $('#exampleModal').modal("show");
  }

  addOrder() {
    var x = this.orders;
    this.http.post('https://localhost:44370/' + 'api/Order/create-order', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.orders = result;
        this.isEdit = true;
        this.searchOrder(1);
        alert("New Order have been added successfully!");
      }
      //else
      //{
      //  alert("Order Date định dạng theo kiểu yyyy-MM-dd!!!");
     // }


    }, error => console.error(error));
  }

  updateOrder() {
    var x = this.orders;
    this.http.post('https://localhost:44370/' + 'api/Order/update-order', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.orders = result;
        this.isEdit = true;
        this.searchOrder(1);
        alert("Order has been successfully updated!");
      }


    }, error => console.error(error));
  }

  deleteOrder(index) {
    var r = confirm("Are you sure to delete this order?");
    if (r == true) {
      this.orders = this.order.data[index];
      var x = {id: this.orders.orderId};  // Vi ben code Visual Studio la kieu id.
      this.http.post('https://localhost:44370/' + 'api/Order/delete-order', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.searchOrder(1);
          alert("Order have been deleted successfully!");
        }
        else {
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }


}
