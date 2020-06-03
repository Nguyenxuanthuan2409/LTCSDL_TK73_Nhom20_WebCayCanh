using System;
using System.Collections.Generic;
using System.Text;

namespace WebCayCanh.DAL.Req
{
    public class CategoryReq
    {
        public string CategoryId { get; set; }
        public string CategoryName { get; set; }
        public byte[] CategoryImage { get; set; }
        public string CategoryDescription { get; set; }
    }
}
