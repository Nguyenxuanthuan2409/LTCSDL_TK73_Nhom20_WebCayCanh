using System;
using System.Collections.Generic;
using System.Text;
using WebCayCanh.Common.DAL;
using System.Linq;

namespace WebCayCanh.DAL
{
    using WebCayCanh.DAL.Models;
    public class CustomerRep: GenericRep<WEBCAYCANHContext, Customer>
    {
        #region -- Overides --
        public override Customer Read(string id)
        {
            var res = new Customer();
            try
            {
                res = All.FirstOrDefault(p => string.Compare(p.CustomerId, id) == 0);
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }
            return res;


        }
       
        public string Remove(string id)
        {

            var m = base.All.First(i => id.Contains(i.CustomerId));
            Context.Customer.Remove(m);
            Context.SaveChanges();
            return m.CustomerId;

        }
        #endregion
    }
}
