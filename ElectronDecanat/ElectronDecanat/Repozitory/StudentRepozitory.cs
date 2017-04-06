using ElectronDecanat.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Repozitory
{
    public class StudentRepozitory: IRepository<NewStudent,Student>
    {
        public IEnumerable<Student> GetAll(string querry = null)
        {
            throw new NotImplementedException();
        }

        public NewStudent Get(int id)
        {
            throw new NotImplementedException();
        }

        public void Create(Student item)
        {
            throw new NotImplementedException();
        }

        public void Update(NewStudent item)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}