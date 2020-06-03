﻿using System;
using System.Collections.Generic;
using System.Text;
using WebCayCanh.Common.DAL;
using System.Linq;

namespace WebCayCanh.DAL
{
    using WebCayCanh.DAL.Models;
    public class OrderRep : GenericRep<WEBCAYCANHContext, Order>
    {
       
        #region -- Overides --
        public override Order Read(string id)
        {
            var res = new Order();
            try
            {
                res = All.FirstOrDefault(p => string.Compare(p.OrderId, id) == 0);
            }
            catch (Exception ex)
            {
                res.SetError(ex.StackTrace);
            }
            return res;


        }
        //public string Remove(string id)
        //{
        //    var m = base.All.First(i => string.Compare(i.CategoryId, id) == 0);
        //    m = base.Delete(m);
        //    return m.CategoryId;
        //}
        public string Remove(string id)
        {

            var m = base.All.First(i => id.Contains(i.OrderId));
            Context.Order.Remove(m);
            Context.SaveChanges();
            return m.OrderId;

        }
        #endregion
    }
}
