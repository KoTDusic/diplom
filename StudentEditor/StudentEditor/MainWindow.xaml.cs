﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace StudentEditor
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private StudentViewModel model;
        public MainWindow()
        {
            InitializeComponent();
            model = new StudentViewModel();
            model.inputs = InputsField;
            this.DataContext = model;
        }

        private void InputsField_Error(object sender, ValidationErrorEventArgs e)
        {
            
        }
    }
}
