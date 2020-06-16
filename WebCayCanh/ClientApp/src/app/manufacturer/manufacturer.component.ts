import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any;

@Component({
  selector: 'app-manufacturer',
  templateUrl: './manufacturer.component.html',
  styleUrls: ['./manufacturer.component.css']
})
export class ManufacturerComponent implements OnInit {

  manufacturer: any = {
    data: [],
    totalRecords: 0,
    page: 0,
    size: 5,
    totalPages: 0
  }
  isEdit:boolean=false;

  manufacturers: any = {   // Khoi tao mac dinh cho vui
    manufacturerId: "PH100",
    manufacturerName: "Nguyen Xuan Thuan",
    manufacturerDescription: "Hello Thuan Lovely",
  }

  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.searchManufacturer(1);
  }

  searchManufacturer(cPage) {
    let x = {
      page: cPage,
      size: 5,
      keyword: ""
    }
    this.http.post('https://localhost:44370/' + 'api/Manufacturer/search-manufacturer', x).subscribe(result => {
      this.manufacturer = result;
      


    }, error => console.error(error));

  }

  searchNext() {
    if (this.manufacturer.page < this.manufacturer.totalPages) {
      let nextPage = this.manufacturer.page + 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Manufacturer/search-manufacturer', x).subscribe(result => {
        this.manufacturer = result;
       

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang cuối cùng!!");
    }
  }

  searchPrevious() {
    if (this.manufacturer.page > 1) {
      let nextPage = this.manufacturer.page - 1;
      let x = {
        page: nextPage,
        size: 5,
        keyword: ""
      }
      this.http.post('https://localhost:44370/' + 'api/Manufacturer/search-manufacturer', x).subscribe(result => {
        this.manufacturer = result;
        

      }, error => console.error(error));
    }
    else {
      alert("Bạn đang đứng ở trang đầu tiên!!");
    }
  }

  openModal(isNew, index) {
    if (isNew) {
      this.isEdit = false;
      this.manufacturers =
      {
        manufacturerId: "",
        manufacturerName: "",
        manufacturerDescription: ""
      }
    }
    else {
      this.isEdit = true;
      this.manufacturers = index;
    }
    $('#exampleModal').modal("show");
  }

  addManufacturer() {
    var x = this.manufacturers;
    this.http.post('https://localhost:44370/' + 'api/Manufacturer/create-manufacturer', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.manufacturers = result;
        this.isEdit = true;
        this.searchManufacturer(1);
        alert("New Manufacturer have been added successfully!");
      }
    }, error => console.error(error));
  }

  updateManufacturer() {
    var x = this.manufacturers;
    this.http.post('https://localhost:44370/' + 'api/Manufacturer/update-manufacturer', x).subscribe(result => {
      var res: any = result;
      if (res.success) {
        this.manufacturers = result;
        this.isEdit = true;
        this.searchManufacturer(1);
        alert("Manufacturer has been successfully updated!");
      }

    }, error => console.error(error));
  }

  deleteManufacturer(index) {
    var r = confirm("Are you sure to delete this manufacturer?");
    if (r == true) {
      this.manufacturers = this.manufacturer.data[index];
      var x = {id: this.manufacturers.manufacturerId};  // Vi ben code Visual Studio la kieu id.
      this.http.post('https://localhost:44370/' + 'api/Manufacturer/delete-manufacturer', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.searchManufacturer(1);
          alert("Manufacturer have been deleted successfully!");
        }
        else {
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }

}
