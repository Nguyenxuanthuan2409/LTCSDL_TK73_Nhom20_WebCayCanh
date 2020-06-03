using System;
using System.Collections.Generic;

namespace WebCayCanh.DAL.Models
{
    public partial class Product
    {
        public Product()
        {
            Orderdetail = new HashSet<Orderdetail>();
        }

        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public int? Amount { get; set; }
        public int? AmountRemaining { get; set; }
       
        public double? OldPrice { get; set; }
        public byte[] ProductImage { get; set; }
        public string ManufacturerId { get; set; }

        internal void SetError(string stackTrace)
        {
            throw new NotImplementedException();
        }

        public string CategoryId { get; set; }
        public string ProductDescription { get; set; }

        public virtual Category Category { get; set; }
        public virtual Manufacturer Manufacturer { get; set; }
        public virtual ICollection<Orderdetail> Orderdetail { get; set; }
    }
}
