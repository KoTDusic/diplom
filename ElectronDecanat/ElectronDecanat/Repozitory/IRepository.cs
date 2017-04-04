using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ElectronDecanat.Repozitory
{
    interface IRepository<T,new_T> 
    {
        IEnumerable<T> GetAll(string querry=null);
        T Get(int id);
        void Create(T item);
        void Update(new_T item);
        void Delete(int id);
    }
}
