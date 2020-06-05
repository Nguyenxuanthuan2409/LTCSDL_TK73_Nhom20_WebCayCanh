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
    public class OrderController : ControllerBase
    {
        public OrderController()
        {
            _svc = new OrderSvc();
        }
       
        [HttpPost("create-order")]
        public IActionResult CreateOrder(OrderReq req)
        {
            var res = _svc.CreateOrder(req);
            return Ok(res);
        }

        [HttpPost("update-order")]
        public IActionResult UpdateOrder(OrderReq req)
        {
            var res = _svc.UpdateOrder(req);
            return Ok(res);
        }

        [HttpPost("search-order")]
        public IActionResult SearchOrder(SearchReq req)
        {
            var res = _svc.SearchOrder(req.keyWord, req.size, req.page);
            return Ok(res);
        }

        [HttpPost("delete-order")]
        public IActionResult DeleteOrder(DeleteReq req)
        {
            var res = _svc.DeleteOrder(req.id);
            return Ok(res);
        }
        private readonly OrderSvc _svc;
    }
}