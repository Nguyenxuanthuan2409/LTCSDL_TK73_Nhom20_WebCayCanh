using System;
using System.Collections.Generic;
using System.Text;
using WebCayCanh.Common.DAL;
using System.Linq;

namespace WebCayCanh.DAL
{
    using WebCayCanh.DAL.Models;
    public class ManufacturerRep : GenericRep<WEBCAYCANHContext, Manufacturer>
    {
        #region -- Overides --
        public override Manufacturer Read(string id)
        {
            var res = new Manufacturer();
            try
            {
                res = All.FirstOrDefault(p => string.Compare(p.ManufacturerId, id) == 0);
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }
            return res;


        }

        public string Remove(string id)
        {

            var m = base.All.First(i => id.Contains(i.ManufacturerId));
            Context.Manufacturer.Remove(m);
            Context.SaveChanges();
            return m.ManufacturerId;

        }
        #endregion
    }
}
