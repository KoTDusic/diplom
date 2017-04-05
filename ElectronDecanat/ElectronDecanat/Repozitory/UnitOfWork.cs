﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronDecanat.Repozitory
{
    public static class UnitOfWork
    {
        private static FacultiesRepository faculties;
        public static FacultiesRepository Faculties
        {
            get
            {
                if (faculties == null) faculties = new FacultiesRepository();
                return faculties;
            }
        }
        private static SpecialityRepozitory specialitys;
        public static SpecialityRepozitory Specialitys
        {
            get
            {
                if (specialitys == null) specialitys = new SpecialityRepozitory();
                return specialitys;
            }
        }
        private static DisciplineRepozitory disciplines;
        public static DisciplineRepozitory Disciplines
        {
            get
            {
                if (disciplines == null) disciplines = new DisciplineRepozitory();
                return disciplines;
            }
        }
        private static GroupRepozitory groups;
        public static GroupRepozitory Groups
        {
            get
            {
                if (groups == null) groups = new GroupRepozitory();
                return groups;
            }
        }
    }
}