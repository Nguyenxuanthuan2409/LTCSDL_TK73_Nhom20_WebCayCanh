import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any;

@Component({
  selector: 'app-customer',
  templateUrl: './customer.component.html',
  styleUrls: ['./customer.component.css']
})
export class CustomerComponent implements OnInit {

  customer: any = {
    data: [],
    totalRecords: 0,
    page: 0,
    size: 5,
    totalPages: 0
  }
  isEdit:boolean=false;

  customers: any = {   // Khoi tao mac dinh cho vui
    customerId: "KH100",
    firstName: "Thuan",
    lastName: "Nguyen Xuan",
    email: "nguyenxuanthuan.999@gmail.com",
    phoneNumber: "0962 741 977",
    street: "Nguyen Kiem",
    district: "Go Vap",
    city: "HCM",
    customerDescription: "Hello Thuan Lovely",
    
  }


  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.searchCustomer(1);
  }

  searchCustomer(cPage) {
    let x = {
      page: cPage,
      size: 5,
      keyword: ""
    }
    this.http.post('https://localhost:44370/' + 'api/Customer/search-customer', x).subscribe(result => {
      this.customer = result;
      


    }, error => console.error(error));

  }

  searchNext() {
    if (this.customer.page < this.customer.totalPages) {
      let nextPage = this.customer.page + 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Customer/search-customer', x).subscribe(result => {
        this.customer = result;
       

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang cuối cùng!!");
    }
  }

  searchPrevious() {
    if (this.customer.page > 1) {
      let nextPage = this.customer.page - 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Customer/search-customer', x).subscribe(result => {
        this.customer = result;
        

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang đầu tiên!!");
    }
  }


  openModal(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.customers =
      {
        customerId: "",
        firstName: "",
        lastName: "",
        email: "",
        phoneNumber: "",
        street: "",
        district: "",
        city: "",
        customerDescription: "",
      }
    }
    else {
      this.isEdit = true;
      this.customers = index;
    }
    $('#exampleModal').modal("show");
  }

  addCustomer() {
    var x = this.customers;
    this.http.post('https://localhost:44370/' + 'api/Customer/create-customer', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.customers = result;
        this.isEdit = true;
        this.searchCustomer(1);
        alert("New Customer have been added successfully!");
      }
      else{
        // alert(res.message);
        alert("Bạn chưa nhập SĐT hay Số điện thoại của bạn phải là 10 số!!!");    // Xuất ra error
      }


    }, error => console.error(error));
  }

  updateCustomer() {
    var x = this.customers;
    this.http.post('https://localhost:44370/' + 'api/Customer/update-customer', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.customers = result;
        this.isEdit = true;
        this.searchCustomer(1);
        alert("Customer has been successfully updated!");
      }
      else{
        alert(res.message);
        
      }


    }, error => console.error(error));
  }
  
  deleteCustomer(index) {
    var r = confirm("Are you sure to delete this customer?");
    if (r == true) {
      this.customers = this.customer.data[index];
      var x = {id: this.customers.customerId};  // Vi ben code Visual Studio la kieu id.
      this.http.post('https://localhost:44370/' + 'api/Customer/delete-customer', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.searchCustomer(1);
          alert("Customer have been deleted successfully!");
        }
        else {
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }


}
