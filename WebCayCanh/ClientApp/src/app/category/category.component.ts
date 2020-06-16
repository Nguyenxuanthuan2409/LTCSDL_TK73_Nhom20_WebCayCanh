import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any;

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css']
})
export class CategoryComponent implements OnInit {

  category: any = {
    data: [],
    totalRecords: 0,
    page: 0,
    size: 5,
    totalPages: 0
  }
  isEdit:boolean=false;

  categories: any = {   // Khoi tao mac dinh cho vui
    categoryId: "LC100",
    categoryName: "Nguyen Xuan Thuan",
    categoryImage: null,
    categoryDescription: "Hello Thuan Lovely",
  }


  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.searchCategory(1);
  }

  searchCategory(cPage) {
    let x = {
      page: cPage,
      size: 5,
      keyword: ""
    }
    this.http.post('https://localhost:44370/' + 'api/Category/search-category', x).subscribe(result => {
      this.category = result;



    }, error => console.error(error));

  }

  searchNext() {
    if (this.category.page < this.category.totalPages) {
      let nextPage = this.category.page + 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Category/search-category', x).subscribe(result => {
        this.category = result;
       

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang cuối cùng!!");
    }
  }

  searchPrevious() {
    if (this.category.page > 1) {
      let nextPage = this.category.page - 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Category/search-category', x).subscribe(result => {
        this.category = result;
        

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang đầu tiên!!");
    }
  }

  openModal(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.categories =
      {
        categoryId: "",
        categoryName: "",
        categoryImage: null,
        categoryDescription: ""
      }
    }
    else {
      this.isEdit = true;
      this.categories = index;
    }
    $('#exampleModal').modal("show");
  }

  addCategory() {
    var x = this.categories;
    this.http.post('https://localhost:44370/' + 'api/Category/create-category', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.categories = result;
        this.isEdit = true;
        this.searchCategory(1);
        alert("New Category have been added successfully!");
      }


    }, error => console.error(error));
  }

  updateCategory() {
    var x = this.categories;
    this.http.post('https://localhost:44370/' + 'api/Category/update-category', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.categories = result;
        this.isEdit = true;
        this.searchCategory(1);
        alert("Category has been successfully updated!");
      }


    }, error => console.error(error));
  }
  
  deleteCategory(index) {
    var r = confirm("Are you sure to delete this category?");
    if (r == true) {
      this.categories = this.category.data[index];
      var x = {id: this.categories.categoryId};  // Vi ben code Visual Studio la kieu id.
      this.http.post('https://localhost:44370/' + 'api/Category/delete-category', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.searchCategory(1);
          alert("Category have been deleted successfully!");
        }
        else {
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }

}
