using System;
using System.Collections.Generic;

namespace WebCayCanh.DAL.Models
{
    public partial class Manufacturer
    {
        public Manufacturer()
        {
            Product = new HashSet<Product>();
        }

        public string ManufacturerId { get; set; }
        public string ManufacturerName { get; set; }
        public string ManufacturerDescription { get; set; }

        public virtual ICollection<Product> Product { get; set; }

        internal void SetError(string stackTrace)
        {
            throw new NotImplementedException();
        }
    }
}
