using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
using System.Threading;
using System.Xml;
using System.Net;

namespace VkTest
{
    public partial class Form1 : Form
    {
        static VkApi api;
        Dictionary<int, Form> chats;
        public Form1()
        {
            InitializeComponent();
            System.Windows.Forms.Control.CheckForIllegalCrossThreadCalls = false;
            api = new VkApi();
            chats = new Dictionary<int, Form>();
            dialog_list.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dialog_list.DataSource = dialogs_data.Tables[0];
        }
        void FillData()
        {
            //авторизация
            EventWaitHandle handler = new EventWaitHandle(false, EventResetMode.AutoReset);
            api.Authorize(handler);
            handler.WaitOne();
            //данные о залогинившемся
            //TextKey.Invoke(new Action<string>(TextKey.AppendText), api.Get_access_code());
            //textAccess_token.Invoke(new Action<string>(textAccess_token.AppendText), api.Get_access_token());
            json_clases.USER res = api.GetUserInfo(api.Get_user_id(), 100)[0];
            TextId.Invoke(new Action<string>(TextId.AppendText), res.id.ToString());
            TextFirst_name.Invoke(new Action<string>(TextFirst_name.AppendText), res.first_name);
            TextLast_name.Invoke(new Action<string>(TextLast_name.AppendText), res.last_name);
            Avatar.Image = LoadImage(res.photo_100);
            //загрузка диалогов
            int dialogcount = 25;
            dialogsProgress.Maximum = dialogcount;
            dialogsProgress.Visible = true;
            Dictionary<int, MESSAGE> dialogs = api.LoadDialogs(20);
            DataGridViewRow [] rows=new DataGridViewRow[dialogcount];
            DataTable dt = dialogs_data.Tables[0];
            MESSAGE part;
            dialog_list.Visible = false;
            for (int i = 0; i < dialogs.Count; i++)
            {
                part=dialogs.ElementAt(i).Value;
                dt.Rows.Add(imageToByteArray(
                    LoadImage(part.avatar_uri)),
                    part.name,
                    part.text,
                    part.user_id);
                dialogsProgress.PerformStep();
            }
            dialog_list.Visible = true;
        }
        public byte[] imageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms.ToArray();
        }
        private void authBtn_Click(object sender, EventArgs e)
        {
            authBtn.Enabled = false;
            Thread auth = new Thread(FillData);
            auth.IsBackground = true;
            auth.Start();
        }
        Image LoadImage(string url)
        {
            WebRequest request = WebRequest.Create(url);
            request.Proxy = null;
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Image data = Image.FromStream(response.GetResponseStream());
            return data;
        }

        private void Form1_Move(object sender, EventArgs e)
        {
            //Invalidate();
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            Invalidate();
        }

        private void dialog_list_Scroll(object sender, ScrollEventArgs e)
        {
            //dialog_list.Invalidate();
        }

        private void dialog_list_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dgw=(DataGridView)sender;
            string id = (string)dgw.Rows.SharedRow(e.RowIndex).Cells[3].Value;
            //api.LoadChat(10, id);
            //
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
