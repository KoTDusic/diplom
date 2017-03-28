using System.ComponentModel;
using System.Runtime.CompilerServices;


namespace StudentEditor 
{
    enum Genders { man, woman, error}
    public class Person : INotifyPropertyChanged
    {
        private string firstName;
        public string FirstName
        {
            get { return firstName; }
            set
            {
                firstName = value;
                OnPropertyChanged("FirstName");
            }
        }
        private string lastName;
        public string LastName
        {
            get { return lastName; }
            set
            {
                lastName = value;
                OnPropertyChanged("LastName");
            }
        } 
        private int age;
        public int Age
        {
            get { return age; }
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
                    default: return "error";
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
                    default: gender = Genders.error;
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
    }
}
