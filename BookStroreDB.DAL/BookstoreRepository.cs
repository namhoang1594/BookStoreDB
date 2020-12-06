using BookStoreDB.Domain.Reponse;
using BookStoreDB.Domain.Request;
using BookStoreDB.Domain.Response;
using BookStroreDB.DAL.Interface;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace BookStoreDB.DAL
{
    public class BookstoreRepository : BaseRepository, IBookstoreRepository
    {
        public async Task<IEnumerable<Bookstore>> Gets()
        {
            return await SqlMapper.QueryAsync<Bookstore>(cnn: connect,
                                                sql: "sp_GetBooks",
                                                commandType: CommandType.StoredProcedure);
        }
        public async Task<CreateBookstoreResult> CreateBookstore(CreateBookstoreRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@BookName", request.BookName);
                parameters.Add("@Author", request.Author);
                parameters.Add("@PublishingHouse", request.PublishingHouse);
                parameters.Add("@Category", request.Category);
                parameters.Add("@YearReleased", request.YearReleased);
                return await SqlMapper.QueryFirstOrDefaultAsync<CreateBookstoreResult>(cnn: connect,
                                                    sql: "sp_CreateBooks",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public async Task<UpdateBookstoreResult> UpdateBookstore(UpdateBookstoreRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ID", request.ID);
                parameters.Add("@BookName", request.BookName);
                parameters.Add("@Author", request.Author);
                parameters.Add("@PublishingHouse", request.PublishingHouse);
                parameters.Add("@Category", request.Category);
                parameters.Add("@YearReleased", request.YearReleased);
                return await SqlMapper.QueryFirstOrDefaultAsync<UpdateBookstoreResult>(cnn: connect,
                                                    sql: "sp_UpdateBooks",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public async Task<DeleteBookstoreResult> DeleteBookstore(DeleteBookstoreRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ID", request.ID);
                return await SqlMapper.QueryFirstOrDefaultAsync<DeleteBookstoreResult>(cnn: connect,
                                                    sql: "sp_DeleteBooks",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        public async Task<DetailsBookstoreResult> DetailsBookstore(DetailsBookstoreRequest request)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@ID", request.ID);
                return await SqlMapper.QueryFirstOrDefaultAsync<DetailsBookstoreResult>(cnn: connect,
                                                    sql: "sp_BookDetails",
                                                    param: parameters,
                                                    commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

    }
}
