using BookStoreDB.BAL.Interface;
using BookStoreDB.Domain.Reponse;
using BookStoreDB.Domain.Request;
using BookStoreDB.Domain.Response;
using BookStroreDB.DAL.Interface;

using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BookStroreDB.BAL
{
    public class BookstoreService : IBookstoreService
    {
        private readonly IBookstoreRepository bookRepository;
        public BookstoreService(IBookstoreRepository bookRepository)
        {
            this.bookRepository = bookRepository;
        }
        public async Task<IEnumerable<Bookstore>> Gets()
        {
            return await bookRepository.Gets();
        }
        public async Task<CreateBookstoreResult> CreateBookstore(CreateBookstoreRequest request)
        {
            return await bookRepository.CreateBookstore(request);
        }
        public async Task<UpdateBookstoreResult> UpdateBookstore(UpdateBookstoreRequest request)
        {
            return await bookRepository.UpdateBookstore(request);
        }
        public async Task<DeleteBookstoreResult> DeleteBookstore(DeleteBookstoreRequest request)
        {
            return await bookRepository.DeleteBookstore(request);
        }
        public async Task<DetailsBookstoreResult> DetailsBookstore(DetailsBookstoreRequest request)
        {
            return await bookRepository.DetailsBookstore(request);
        }
    }
}
