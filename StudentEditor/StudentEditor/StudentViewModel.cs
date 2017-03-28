using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace StudentEditor
{
    enum ModelState { Empty,Edit,Delete,Add,Normal}
    class StudentViewModel : INotifyPropertyChanged
    {
        public StackPanel inputs;
        private Person newStudent;
        private Person selectedStudent;
        public Person SelectedStudent
        {
            get { return selectedStudent; }
            set
            {
                selectedStudent = value;
                EditButtonEnable = true;
                OnPropertyChanged("EditButtonEnable");
                OnPropertyChanged("SelectedStudent");
            }
        }
        public Visibility ListVisibility { get; set; }
        public Visibility FieldsVisibility { get; set; }
        public bool ListEnabled { get; set; }
        public bool CreateButtonEnable { get; set; }
        public bool EditButtonEnable { get; set; }
        public Visibility SaveButtonVisible { get; set; }
        public Visibility UpdateButtonVisible { get; set; }
        public ObservableCollection<Person> students{ get; set; }
        private string validationText;
        public string ValidationText
        {
            get
            {
                return validationText;
            }
            set 
            {
                validationText = value;
                OnPropertyChanged("ValidationText");
            }
        }
        public StudentViewModel()
        {
            students = new ObservableCollection<Person>()
            {
                new Person() { NumericAge = 23, FirstName = "Катя", LastName = "Иванова", Gender="Ж"  },
                new Person() { NumericAge = 36, FirstName = "Сергей", LastName = "Сергеев", Gender="М" },
                new Person() { NumericAge = 42, FirstName = "Сидор", LastName = "Сидоров", Gender="М" },
                new Person() { NumericAge = 22, FirstName = "Наталья", LastName = "Петрова", Gender="Ж" },
                new Person() { NumericAge = 30, FirstName = "Анатолий", LastName = "Попов", Gender="М" }
            };
            if (students.Count == 0) ChangeState(ModelState.Empty);
            else ChangeState(ModelState.Normal);
        }

        private void ChangeState(ModelState newState)
        {
            switch(newState)
            {
                case ModelState.Normal:
                    ListVisibility = Visibility.Visible;
                    FieldsVisibility = Visibility.Collapsed;
                    ListEnabled = true;
                    CreateButtonEnable = true;
                    EditButtonEnable = false;
                    break;
                case ModelState.Empty:
                    ListVisibility = Visibility.Collapsed;
                    FieldsVisibility = Visibility.Collapsed;
                    ListEnabled = true;
                    CreateButtonEnable = true;
                    EditButtonEnable = false;
                    break;
                case ModelState.Add:
                    ListVisibility = Visibility.Visible;
                    FieldsVisibility = Visibility.Visible;
                    ListEnabled = false;
                    CreateButtonEnable = false;
                    EditButtonEnable = false;
                    SaveButtonVisible = Visibility.Visible;
                    UpdateButtonVisible = Visibility.Collapsed;
                    break;
                case ModelState.Edit:
                    ListVisibility = Visibility.Visible;
                    FieldsVisibility = Visibility.Visible;
                    ListEnabled = false;
                    CreateButtonEnable = false;
                    EditButtonEnable = false;
                    SaveButtonVisible = Visibility.Collapsed;
                    UpdateButtonVisible = Visibility.Visible;
                    break;
            }
            OnPropertyChanged("ListVisibility");
            OnPropertyChanged("FieldsVisibility");
            OnPropertyChanged("CreateButtonEnable");
            OnPropertyChanged("ListEnabled");
            OnPropertyChanged("EditButtonEnable");
            OnPropertyChanged("SaveButtonVisible");
            OnPropertyChanged("UpdateButtonVisible");
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
                        newStudent = student;
                        SelectedStudent = newStudent;
                        ChangeState(ModelState.Add);
                    });
                return addCommand;
            }
        }
        private RelayCommand editCommand;
        public RelayCommand EditCommand
        {
            get
            {
                if (editCommand == null) editCommand = new RelayCommand(obj =>
                {
                    ChangeState(ModelState.Edit);
                });
                return editCommand;
            }
        }
        private RelayCommand cancellCommand;
        public RelayCommand CancellCommand
        {
            get
            {
                if (cancellCommand == null) cancellCommand = new RelayCommand(obj =>
                {
                    ChangeState(ModelState.Normal);
                });
                return cancellCommand;
            }
        }
        private RelayCommand updateCommand;
        public RelayCommand UpdateCommand
        {
            get
            {
                if (updateCommand == null) updateCommand = new RelayCommand(obj =>
                {
                    if (ValidateForm())
                    {
                        IEnumerable<TextBox> text_inputs = inputs.Children.OfType<TextBox>();
                        foreach (TextBox input in text_inputs)
                        {
                            input.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                        }
                        inputs.Children.OfType<ComboBox>().ElementAt(0).GetBindingExpression(ComboBox.TextProperty).UpdateSource();
                        selectedStudent = null;
                        OnPropertyChanged("SelectedStudent");
                        ChangeState(ModelState.Normal);
                     }
                });
                return updateCommand;
            }
        }
        private RelayCommand saveCommand;
        public RelayCommand SaveCommand
        {
            get
            {
                if (saveCommand == null) saveCommand = new RelayCommand(obj =>
                {
                    if (ValidateForm())
                        {
                            students.Insert(0, newStudent);
                            selectedStudent = null;
                            newStudent = null;
                            ChangeState(ModelState.Normal);
                        }
                });
                return saveCommand;
            }
        }
        public bool ValidateForm()
        {
            ValidationText = "";
            IEnumerable<TextBox> text_inputs = inputs.Children.OfType<TextBox>();
            string name_text = text_inputs.ElementAt(0).Text;
            string lastname_text = text_inputs.ElementAt(1).Text;
            string age_text = text_inputs.ElementAt(2).Text;
            try
            {
                int age = Convert.ToInt32(age_text);
                if (age < 16 || age > 100) throw new Exception();
            }
             catch(Exception)
            {
                ValidationText+="Возраст должен находиться в диапазоне [16, 100]\n";
            }
            if (lastname_text.Length == 0) ValidationText += "Поле фамилии обязательно для заполнения\n";
            if (name_text.Length == 0) ValidationText += "Поле имени обязательно для заполнения\n";
            if (ValidationText.Length!=0) return false;
            else return true;
        }
    }
}
