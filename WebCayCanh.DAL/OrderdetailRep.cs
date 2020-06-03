using System;
using System.Collections.Generic;
using System.Text;
using WebCayCanh.Common.DAL;
using System.Linq;

namespace WebCayCanh.DAL
{
    using WebCayCanh.DAL.Models;
    public class OrderdetailRep : GenericRep<WEBCAYCANHContext, Orderdetail>
    {
        #region -- Overides --
        public override Orderdetail Read(string id)
        {
            var res = new Orderdetail();
            try
            {
                res = All.FirstOrDefault(p => string.Compare(p.OrderdetailId, id) == 0);
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }
            return res;


        }

        public string Remove(string id)
        {

            var m = base.All.First(i => id.Contains(i.OrderdetailId));
            Context.Orderdetail.Remove(m);
            Context.SaveChanges();
            return m.OrderdetailId;

        }
        #endregion
    }
}
