using BookStoreDB.Domain.Reponse;
using BookStoreDB.Domain.Request;
using BookStoreDB.Domain.Response;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BookStroreDB.DAL.Interface
{
   public interface IBookstoreRepository
    {
        Task<IEnumerable<Bookstore>> Gets();
        Task<CreateBookstoreResult> CreateBookstore(CreateBookstoreRequest request);
        Task<UpdateBookstoreResult> UpdateBookstore(UpdateBookstoreRequest request);
        Task<DeleteBookstoreResult> DeleteBookstore(DeleteBookstoreRequest request);
        Task<DetailsBookstoreResult> DetailsBookstore(DetailsBookstoreRequest request);



    }
}
