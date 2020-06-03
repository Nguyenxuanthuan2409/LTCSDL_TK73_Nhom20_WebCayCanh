using System;
using System.Collections.Generic;
using System.Text;
using WebCayCanh.Common.DAL;
using System.Linq;

namespace WebCayCanh.DAL
{
    using WebCayCanh.DAL.Models;
    public class ProductRep : GenericRep<WEBCAYCANHContext, Product>
    {
        #region -- Overides --
        public override Product Read(string id)
        {
            var res = new Product();
            try
            {
                res = All.FirstOrDefault(p => string.Compare(p.ProductId, id) == 0);
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }
            return res;


        }

        public string Remove(string id)
        {

            var m = base.All.First(i => id.Contains(i.ProductId));
            Context.Product.Remove(m);
            Context.SaveChanges();
            return m.ProductId;

        }
        #endregion
    }
}
