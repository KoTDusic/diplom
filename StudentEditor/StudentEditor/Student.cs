using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace StudentEditor 
{
    enum Genders {man, woman}
    public class Person : INotifyPropertyChanged, IDataErrorInfo
    {
        private string firstName = "";
        public string FirstName
        {
            get { return firstName; }
            set
            {
                firstName = value;
                OnPropertyChanged("FirstName");
                OnPropertyChanged("FIO");
            }
        }
        public string FIO
        {
            get 
            {
                return firstName +" "+ lastName;
            }
        }
        private string lastName = "";
        public string LastName
        {
            get { return lastName; }
            set
            {
                
                lastName = value;
                OnPropertyChanged("LastName");
                OnPropertyChanged("FIO");
            }
        }
        private int age;
        public string Age
        {
            get {
                    if (age == 0) return "";
                    else return age + " лет";
                }
        }
        public int NumericAge
        {
            get
            {
                return age;
            }
            set
            {
                age = value;
                OnPropertyChanged("Age");
            }
        }
        private Genders gender;
        public string Gender
        {
            get 
            { 
                switch (gender)
                {
                    case Genders.man:   return "М";
                    case Genders.woman: return "Ж";
                    default: return "М";
                }
            }
            set
            {
                switch(value)
                {
                    case "М": gender = Genders.man;
                        break;
                    case "Ж": gender = Genders.woman;
                        break;
                    default: gender = Genders.man;
                        break;
                }
                OnPropertyChanged("Gender");
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName]string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }

        public string Error
        {
            get { throw new NotImplementedException(); }
        }

        public string this[string columnName]
        {
            get { throw new NotImplementedException(); }
        }
    }
}
