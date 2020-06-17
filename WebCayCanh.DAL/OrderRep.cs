using System;
using System.Collections.Generic;
using System.Text;
using WebCayCanh.Common.DAL;
using System.Linq;
using WebCayCanh.Common.Rsp;

namespace WebCayCanh.DAL
{
    using Microsoft.Data.SqlClient;
    using Microsoft.EntityFrameworkCore;
    using System.Data;
    using System.Xml.Serialization;
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
        public SingleRsp CreateOrder(Order pro)
        {
            var res = new SingleRsp();
            using (var context = new WEBCAYCANHContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var t = context.Order.Add(pro);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        res.SetError(ex.StackTrace);
                    }
                }
            }
            res.Data = pro;
            return res;
        }

        public object spSel_LayChiTietDonHangTheoID(string orId)       // ADO.DOT NET
        {
            List<object> res = new List<object>();      // res la result , ket qua
            var cnn = (SqlConnection)Context.Database.GetDbConnection();
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                var cmd = cnn.CreateCommand();
                cmd.CommandText = "LayChiTietDonHangTheoID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", orId);
                da.SelectCommand = cmd;
                da.Fill(ds);        // do du lieu vao
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)  // Kiem tra co du lieu hay khong
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var x = new
                        {
                            ORDER_ID = row["ORDER_ID"],
                            ORDER_DATE = row["ORDER_DATE"],
                            ORDER_NUMBER = row["ORDER_NUMBER"],
                            CUSTOMER_ID = row["CUSTOMER_ID"],
                            ORDER_DESCRIPTION = row["ORDER_DESCRIPTION"],
                            ORDERDETAIL_ID = row["ORDERDETAIL_ID"],
                            PRICE = row["PRICE"],
                            QUANTITY = row["QUANTITY"],
                            // ORDER_ID = row["ORDER_ID"],
                            PRODUCT_ID = row["PRODUCT_ID"],
                            USERID = row["USERID"],
                            ORDERDETAIL_DESCRIPTION = row["ORDERDETAIL_DESCRIPTION"],
                        };
                        res.Add(x);
                    }
                }

            }
            catch (Exception e)
            {
                res = null;
            }
            return res;
        }

        public object spSel_OrderFromToPagination(DateTime dateF, DateTime dateT, int size, int page)       // ADO.DOT NET
        {
            List<object> res = new List<object>();      // res la result , ket qua
            var cnn = (SqlConnection)Context.Database.GetDbConnection();
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                var cmd = cnn.CreateCommand();
                cmd.CommandText = "OrderFromToPagination";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dateF", dateF);   // Phai giong ben khai bao bien cua SQL
                cmd.Parameters.AddWithValue("@dateT", dateT);
                cmd.Parameters.AddWithValue("@size", size);
                cmd.Parameters.AddWithValue("@page", page);
                da.SelectCommand = cmd;
                da.Fill(ds);        // do du lieu vao
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)  // Kiem tra co du lieu hay khong
                {
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        var x = new
                        {
                            ORDER_ID = row["ORDER_ID"],
                            ORDER_DATE = row["ORDER_DATE"],
                            ORDER_NUMBER = row["ORDER_NUMBER"],
                            CUSTOMER_ID = row["CUSTOMER_ID"],
                            ORDER_DESCRIPTION = row["ORDER_DESCRIPTION"],
                           

                        };
                        res.Add(x);
                    }
                }

            }
            catch (Exception e)
            {
                res = null;
            }
            return res;
        }

        public object spSel_LayChiTietDonHangTheoID_LinQ(string orId)       // ADO.DOT NET LIN Q
        {
            var res = Context.Orderdetail
                .Join(Context.Order, a => a.OrderId, b => b.OrderId, (a, b) => new
                {
                    a.OrderId,    // Lay cac Trường trong Stored
                    b.OrderDate,
                    b.OrderNumber,
                    b.CustomerId,
                    b.OrderDescription,
                    a.OrderdetailId,
                    a.Price,
                    a.Quantity,
                    // a.OrderId,
                    a.ProductId,
                    a.Userid,
                    a.OrderdetailDescription,


                    
                })
                .Where(x => x.OrderId == orId)
                .ToList();

            
            return res;    // Return kiểu dữ liệu trả về

        }

        

        #endregion
    }
}
