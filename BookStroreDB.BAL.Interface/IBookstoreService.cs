using BookStoreDB.Domain.Reponse;
using BookStoreDB.Domain.Request;
using BookStoreDB.Domain.Response;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BookStoreDB.BAL.Interface
{
    public interface IBookstoreService
    {
        Task<IEnumerable<Bookstore>> Gets();
        Task<CreateBookstoreResult> CreateBookstore(CreateBookstoreRequest request);
        Task<UpdateBookstoreResult> UpdateBookstore(UpdateBookstoreRequest request);
        Task<DeleteBookstoreResult> DeleteBookstore(DeleteBookstoreRequest request);
        Task<DetailsBookstoreResult> DetailsBookstore(DetailsBookstoreRequest request);




    }
}
