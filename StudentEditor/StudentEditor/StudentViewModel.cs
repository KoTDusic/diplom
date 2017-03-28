using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace StudentEditor
{
    class StudentViewModel : INotifyPropertyChanged
    {
        private Person selectedStudent;
        public Person SelectedStudent
        {
            get { return selectedStudent; }
            set
            {
                selectedStudent = value;
                OnPropertyChanged("SelectedStudent");
            }
        }
        public ObservableCollection<Person> students{ get; set; }
        public StudentViewModel()
        {
            students = new ObservableCollection<Person>()
            {
                new Person() { Age = 23, FirstName = "Катя", LastName = "Иванова", Gender="Ж"  },
                new Person() { Age = 36, FirstName = "Сергей", LastName = "Сергеев", Gender="М" },
                new Person() { Age = 42, FirstName = "Сидор", LastName = "Сидоров", Gender="М" },
                new Person() { Age = 22, FirstName = "Наталья", LastName = "Петрова", Gender="Ж" },
                new Person() { Age = 3, FirstName = "Анатолий", LastName = "Попов", Gender="М" }
            };
        }
        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName]string prop = "")
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(prop));
        }
        private RelayCommand addCommand;
        public RelayCommand AddCommand
        {
            get
            {
                if(addCommand==null) addCommand = new RelayCommand(obj =>
                    {
                        Person student = new Person();
                        students.Insert(0, student);
                        SelectedStudent = student;
                    });
                return addCommand;
            }
        }
    }
}
