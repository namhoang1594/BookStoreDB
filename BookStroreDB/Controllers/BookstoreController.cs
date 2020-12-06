using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BookStoreDB.BAL.Interface;
using BookStoreDB.Domain.Request;
using Microsoft.AspNetCore.Mvc;

namespace BookStroreDB.API.Controllers
{
    [ApiController]
    public class BookstoreController : Controller
    {
        private readonly IBookstoreService bookService;

        public BookstoreController(IBookstoreService bookService)
        {
            this.bookService = bookService;
        }
        [HttpGet]
        [Route("/api/book/gets")]
        public async Task<OkObjectResult> Gets()
        {
            return Ok(await bookService.Gets());
        }
        [HttpPost]
        [Route("/api/book/create")]
        public async Task<OkObjectResult> Create(CreateBookstoreRequest request)
        {
            return Ok(await bookService.CreateBookstore(request));
        }
        [HttpPost]
        [Route("/api/book/update")]
        public async Task<OkObjectResult> Update(UpdateBookstoreRequest request)
        {
            return Ok(await bookService.UpdateBookstore(request));
        }
        [HttpDelete]
        [Route("/api/book/delete")]
        public async Task<OkObjectResult> Delete(DeleteBookstoreRequest request)
        {
            return Ok(await bookService.DeleteBookstore(request));
        }
        [HttpPost]
        [Route("/api/book/details")]
        public async Task<OkObjectResult> Details(DetailsBookstoreRequest request)
        {
            return Ok(await bookService.DetailsBookstore(request));
        }
    }
}
