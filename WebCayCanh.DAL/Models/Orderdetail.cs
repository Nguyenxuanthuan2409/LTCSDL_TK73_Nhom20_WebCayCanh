using System;
using System.Collections.Generic;

namespace WebCayCanh.DAL.Models
{
    public partial class Orderdetail
    {
        public string OrderdetailId { get; set; }
        public double? Price { get; set; }
        public int? Quantity { get; set; }
        public string OrderId { get; set; }
        public string ProductId { get; set; }
        public string Userid { get; set; }
        public string OrderdetailDescription { get; set; }

        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
        public virtual Users User { get; set; }

        internal void SetError(string stackTrace)
        {
            throw new NotImplementedException();
        }
    }
}
