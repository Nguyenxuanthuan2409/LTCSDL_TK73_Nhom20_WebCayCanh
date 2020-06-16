import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any;

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css']
})
export class UsersComponent implements OnInit {

  user: any = {
    data: [],
    totalRecords: 0,
    page: 0,
    size: 5,
    totalPages: 0
  }
  isEdit:boolean=false;

  users: any = {   // Khoi tao mac dinh cho vui
    userid: "US100",
    email: "xuanthuan@gmail.com",
    firstName: "Thuận",
    lastName: "Nguyễn Xuân",
    username: "xuanthuan24",
    passwords: "24091999",
    isActive: false,
    phoneNumber: "0962741977",
    usersImage: null,
    usersDescription: "Hello Thuan Lovely",
    
  }


  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.searchUser(1);
  }

  searchUser(cPage) {
    let x = {
      page: cPage,
      size: 5,
      keyword: ""
    }
    this.http.post('https://localhost:44370/' + 'api/Users/search-users', x).subscribe(result => {
      this.user = result;
      


    }, error => console.error(error));

  }

  searchNext() {
    if (this.user.page < this.user.totalPages) {
      let nextPage = this.user.page + 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Users/search-users', x).subscribe(result => {
        this.user = result;
       

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang cuối cùng!!");
    }
  }

  searchPrevious() {
    if (this.user.page > 1) {
      let nextPage = this.user.page - 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Users/search-users', x).subscribe(result => {
        this.user = result;
        

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang đầu tiên!!");
    }
  }

  openModal(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.users =
      {
        userid: "",
        email: "",
        firstName: "",
        lastName: "",
        username: "",
        passwords: "",
        isActive: false,
        phoneNumber: "",
        usersImage: null,
        usersDescription: "Hello New User",
      }
    }
    else {
      this.isEdit = true;
      this.users = index;
    }
    $('#exampleModal').modal("show");
  }

  addUser() {
    var x = this.users;
    this.http.post('https://localhost:44370/' + 'api/Users/create-users', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.users = result;
        this.isEdit = true;
        this.searchUser(1);
        alert("New User have been added successfully!");
      }
      else{
        // alert(res.message);
        alert("Bạn chưa nhập SĐT hay Số điện thoại của bạn phải là 10 số!!!");    // Xuất ra error
      }


    }, error => console.error(error));
  }

  updateUser() {
    var x = this.users;
    this.http.post('https://localhost:44370/' + 'api/Users/update-users', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.users = result;
        this.isEdit = true;
        this.searchUser(1);
        alert("User has been successfully updated!");
      }
      else{
        alert(res.message);
        
      }


    }, error => console.error(error));
  }

  deleteUser(index) {
    var r = confirm("Are you sure to delete this user?");
    if (r == true) {
      this.users = this.user.data[index];
      var x = {id: this.users.userid};  // Vi ben code Visual Studio la kieu id.
      this.http.post('https://localhost:44370/' + 'api/Users/delete-users', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.searchUser(1);
          alert("User have been deleted successfully!");
        }
        else {
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }

}
