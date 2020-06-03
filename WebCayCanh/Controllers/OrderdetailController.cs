using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebCayCanh.Web.Controllers
{
    using BLL;
    using DAL.Models;
    using Common.Req;
    using Common.Rsp;
    using WebCayCanh.DAL.Req;

    [Route("api/[controller]")]
    [ApiController]
    public class OrderdetailController : ControllerBase
    {
        public OrderdetailController()
        {
            _svc = new OrderdetailSvc();
        }

        [HttpPost("create-Orderdetail")]
        public IActionResult CreateOrderdetail(OrderdetailReq req)
        {
            var res = _svc.CreateOrdertail(req);
            return Ok(res);
        }

        [HttpPost("update-Orderdetail")]
        public IActionResult UpdateCategory(OrderdetailReq req)
        {
            var res = _svc.UpdateOrderdetail(req);
            return Ok(res);
        }

        [HttpPost("search-Orderdetail")]
        public IActionResult SearchOrderdetail(SearchReq req)
        {
            var res = _svc.SearchOrderdetail(req.keyWord, req.size, req.page);
            return Ok(res);
        }

        [HttpPost("delete-Orderdetail")]
        public IActionResult DeleteOrderdetail(DeleteReq req)
        {
            var res = _svc.DeleteOrderdetail(req.id);
            return Ok(res);
        }

        private readonly OrderdetailSvc _svc;
    }
}
