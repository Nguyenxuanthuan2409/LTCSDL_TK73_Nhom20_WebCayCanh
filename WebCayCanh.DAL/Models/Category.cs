using System;
using System.Collections.Generic;

namespace WebCayCanh.DAL.Models
{
    public partial class Category
    {
        public Category()
        {
            Product = new HashSet<Product>();
        }

        public string CategoryId { get; set; }
        public string CategoryName { get; set; }
        public byte[] CategoryImage { get; set; }
        public string CategoryDescription { get; set; }

        public virtual ICollection<Product> Product { get; set; }

        internal void SetError(string stackTrace)
        {
            throw new NotImplementedException();
        }
    }
}
