using System;
using System.Collections.Generic;
using System.Text;

namespace WebCayCanh.DAL.Req
{
    public class SearchReq
    {
        public int size { get; set; }
        public int page { get; set; }
        public String keyWord { get; set; }
    }
}
