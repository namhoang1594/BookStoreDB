using System;
using System.Collections.Generic;
using System.Text;

namespace BookStoreDB.Domain.Response
{
    public class DetailsBookstoreResult
    {
        public int ID { get; set; }
        public string BookName { set; get; }
        public string Author { set; get; }
        public string PublishingHouse { set; get; }
        public string Category { set; get; }
        public int YearReleased { set; get; }
        public string Message { get; set; }
    }
}
