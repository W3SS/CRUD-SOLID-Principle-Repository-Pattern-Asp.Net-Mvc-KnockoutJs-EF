﻿using System.Collections.Generic;

namespace OnBoardingTaskV3.DAL
{
    public interface IRepository<T> where T : class
    {
        IEnumerable<T> GetAllRecords();
        T AddRecord(T entity);
        void UpdateRecord(T entity);
        T DeleteRecord(int Id);      
    }
}
