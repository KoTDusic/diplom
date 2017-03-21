using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace VkTest
{
    public partial class Form2 : Form
    {
        Form1 parent;
        VkApi api;
        DataTable data_table;
        public Form2(Form1 par)
        {
            parent = par;
            InitializeComponent();
            messages_list.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            messages_list.DataSource = dialog_data.Tables[0];
            data_table = dialog_data.Tables[0];
        }
        public void AddMessage(string author, string text)
        {
            data_table.Rows.Add(author, text);
        }
        public void Normalize()
        {
            this.StartPosition = FormStartPosition.CenterScreen;
        }
    }
}
