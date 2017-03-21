using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Windows.Forms;
using System.Threading;
using System.Xml;
using System.Xml.Linq;
using Newtonsoft.Json;

namespace VkTest
{
    class VkApi
    {
        EventWaitHandle gethedKey;
        Dictionary<int, MESSAGE> dialogs;
        public const string api_version = "5.52";
        string user_id = "";
        string access_token = "";
        string ConnectionString;
        string ConnectionString2;
        string access_code = "";
        public string Get_access_code() { return access_code; }
        public string Get_access_token() { return access_token; }
        public string Get_user_id() { return user_id; }
        public VkApi()
        {
            dialogs = new Dictionary<int, MESSAGE>();
            string app_id = "5524900";
            string app_key = "33ZOPFGccEckGm6iAEZJ";
            string redirect_uri = @"https://oauth.vk.com/blank.html";
            string display_type = "page";
            string response_type = "token";
            string perimssions = "messages";
            string auth_link = @"https://oauth.vk.com/authorize";
            string auth2_link = @"https://oauth.vk.com/access_token";
            
            ConnectionString =
                  auth_link + "?"
                  + "client_id=" + app_id + "&"
                  + "display=" + display_type + "&"
                  + "redirect_uri=" + redirect_uri + "&"
                  + "scope=" + perimssions + "&"
                  + "type=" + response_type + "&" +
                  "v=" + api_version /*+ "&"
                  + "revoke=1"*/;
            ConnectionString2 =
                auth2_link + "?"
                + "client_id=" + app_id + "&"
                + "client_secret=" + app_key + "&"
                + "redirect_uri=" + redirect_uri + "&"
                + "code=";
        }
        public void Authorize(EventWaitHandle finish)
        {
            bool need_new_key = true;
            need_new_key=NeedAuthorize();
            if (need_new_key)
            {
                EventWaitHandle gethedKey = new EventWaitHandle(false, EventResetMode.AutoReset);
                Thread authorizator = new Thread(new ParameterizedThreadStart(Authorize1));
                authorizator.IsBackground = true;
                authorizator.SetApartmentState(ApartmentState.STA);//иначе выбрасывает исключение "текущий поток не находится в однопоточном контейнере"
                authorizator.Start(gethedKey);
                gethedKey.WaitOne();
                authorizator.Abort();
                Authorize2();
            }
            finish.Set();
        }
        private void Authorize1(object e)
        {
            Form auth = new Form();
            auth.ControlBox = false;
            gethedKey = (EventWaitHandle)e;
            auth.Width = 700;
            auth.Height = 500;
            WebBrowser authorization_browser = new WebBrowser();
            authorization_browser.Dock = DockStyle.Fill;
            authorization_browser.Navigated += authorization_browser_Navigated;
            auth.Controls.Add(authorization_browser);
            authorization_browser.Navigate(ConnectionString);
            auth.ShowDialog(); 
        }
        private void Authorize2()
        {
            HttpWebRequest auth = (HttpWebRequest)WebRequest.Create(ConnectionString2 + access_code);
            auth.Proxy = null;
            try
            {
                HttpWebResponse response = (HttpWebResponse)auth.GetResponse();
                string serialized;
                using (StreamReader stream = new StreamReader(response.GetResponseStream()))
                {
                    serialized = stream.ReadToEnd();
                }
                json_clases.TOKEN_DATA res = JsonConvert.DeserializeObject<json_clases.TOKEN_DATA>(serialized);
                if (res.expires_in == 0 || res.user_id == 0) throw new Exception("Не удалось получить токен доступа");
                user_id = res.user_id.ToString();
                access_token = res.access_token;
                StreamWriter fstream = new StreamWriter(File.OpenWrite("key.key"));
                fstream.Write(access_token);
                fstream.Dispose();

            }
            catch(Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        public List<json_clases.USER> GetUserInfo(string needed_user_id, string photo_size)
        {
            string param =
                "user_ids=" + needed_user_id + "&"
                + "fields=" + "photo_" + photo_size + "&"
                + "v=" + api_version;
            string serialized = SendRequest("users.get", param);
            json_clases.USER_INFO res = JsonConvert.DeserializeObject<json_clases.USER_INFO>(serialized);
            return res.response;
        }
        public List<MESSAGE_IN_DIALOG> LoadChat(int number,int id)
        {
            List<MESSAGE_IN_DIALOG> chat = new List<MESSAGE_IN_DIALOG>();
            string param =
                 "count=" + number + "&"
                 + "user_id=" + id + "&"
                 + "v=" + api_version;
            XmlDocument res = new XmlDocument();
            SendRequest("messages.getHistory", param, true, res);
            XmlNodeList mesages = res.GetElementsByTagName("dialog");
            MESSAGE_IN_DIALOG current_message;
            for (int i = 0; i < mesages.Count; i++)
            {
                //current_dialog = ParseMesage(mesages.Item(i)["message"]);
                //dialogs.Add(current_dialog.user_id, current_dialog);
            }
            return chat;
        }
       /* private MESSAGE_IN_DIALOG ParseMessage(XmlNode message)
        {
            MESSAGE result = new MESSAGE();
            result.avatar_uri = null;
            result.user_id = Convert.ToInt32(message["user_id"].InnerText);
            if (result.user_id < 0) result.is_group = true;
            result.text = message["body"].InnerText;
            if (message["read_state"].InnerText == "1") result.readed = true;
            else result.readed = false;
            if (message["out"].InnerText == "1") result.my_message = true;
            else result.my_message = false;
            if (message["chat_id"] != null) result.is_group = true;
            if (result.is_group)
            {
                if (result.user_id > 0) result.user_id = 2000000000 + Convert.ToInt32(message["chat_id"].InnerText);
                XmlElement avatar = message["photo_50"];
                if (avatar != null) result.avatar_uri = avatar.InnerText;
                else result.avatar_uri = @"http://vk.com/images/deactivated_50.gif";
                result.name = message["title"].InnerText;
            }
            return result;
        }*/
        private MESSAGE ParseDialog(XmlNode message)
        {
            MESSAGE result = new MESSAGE();
            result.avatar_uri = null;
            result.user_id = Convert.ToInt32(message["user_id"].InnerText);
            if (result.user_id < 0) result.is_group = true;
            result.text = message["body"].InnerText;
            if (message["read_state"].InnerText == "1") result.readed = true;
            else result.readed = false;
            if (message["out"].InnerText == "1") result.my_message = true;
            else result.my_message = false;
            if (message["chat_id"] != null) result.is_group = true;
            if (result.is_group)
            {
                if (result.user_id>0) result.user_id = 2000000000 + Convert.ToInt32(message["chat_id"].InnerText);
                XmlElement avatar = message["photo_50"];
                if(avatar!=null) result.avatar_uri = avatar.InnerText;
                else result.avatar_uri = @"http://vk.com/images/deactivated_50.gif";
                result.name = message["title"].InnerText;
            }
            return result;
        }
        public Dictionary<int, MESSAGE> LoadDialogs(int number)
        {
            string param =
                 "count=" + number + "&"
                 + "preview_length="+90+"&"
                 + "v=" + api_version;
            XmlDocument res = new XmlDocument();
            SendRequest("messages.getDialogs", param,true,res);
            XmlNodeList mesages = res.GetElementsByTagName("dialog");
            StringBuilder id_users=new StringBuilder();
            MESSAGE current_dialog;
            for (int i = 0; i < mesages.Count; i++)
            {
                current_dialog = ParseDialog(mesages.Item(i)["message"]);
                dialogs.Add(current_dialog.user_id, current_dialog);
                if(current_dialog.is_group==false) 
                {
                    if(id_users.Length!=0) id_users.Append(",");
                    id_users.Append(current_dialog.user_id);
                }
            }
            List<json_clases.USER> user_array = GetUserInfo(id_users.ToString(),50);
            MESSAGE temp;
            //добавление ссылок на аватары пользователям
            for (int i = 0; i < user_array.Count; i++)
            {
                temp=dialogs[user_array[i].id];
                temp.avatar_uri = user_array[i].photo_50;
                temp.name = user_array[i].first_name + " " + user_array[i].last_name;
                dialogs[user_array[i].id] = temp;
            }
            return dialogs;
        }
        private bool NeedAuthorize()
        {
            bool res;
            try
            {
                using (StreamReader fstream = new StreamReader(File.OpenRead("key.key")))
                {
                    access_token = fstream.ReadLine();
                }
                XmlDocument test = new XmlDocument();
                SendRequest("users.get", "", true, test);
                XmlElement test_elem = test.ChildNodes.Item(0)["error"];
                if (test_elem == null)
                {
                    res = false;
                    user_id = test.GetElementsByTagName("uid")[0].InnerText;
                }
                else res = true;
            }
            catch (Exception)
            {
                res = true;
            }
            return res;
        }
        private string SendRequest(string remote_function,string param,bool XML_mode=false,XmlDocument result=null)
        {
            if (XML_mode==true && result == null) return "error";//если запросили xml и не передали объект для результата
            string XML_sufix="";
            if (XML_mode) XML_sufix = ".xml";
            string req_string = String.Format("https://api.vk.com/method/{0}?access_token={1}&{2}", remote_function + XML_sufix, access_token, param);
            WebRequest request = WebRequest.Create(req_string);
            request.Proxy = null;
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            string res="";
            using (StreamReader sr = new StreamReader(response.GetResponseStream()))
            {
                res = sr.ReadToEnd();
                if (XML_mode)
                {
                    result.LoadXml(res);
                }
            }
            return res;
        }
        void authorization_browser_Navigated(object sender, EventArgs e)
        {
            WebBrowser browser=(WebBrowser)sender;
            string addres = browser.Url.ToString();
            
            int index_code = addres.IndexOf("#code=");
            if (index_code != -1) //Проверка авторизации
            {
                access_code = addres.Substring(31 + 6); //обрезать строку до кода
                gethedKey.Set();
                return;
            }
            //MessageBox.Show(addres);
            int error_code = addres.IndexOf("?error=");
            if (error_code != -1) //Проверка авторизации
            {
                browser.Navigate(ConnectionString);
            }
        }      
    }
    struct MESSAGE
    {
        public int user_id;
        public string avatar_uri;
        public string name;
        public string text;
        public bool is_group;
        public bool readed;
        public bool my_message;
    }
    struct MESSAGE_IN_DIALOG
    {
        public int message_id;
        public string name;
        public string text;
        public bool readed;
    }
    namespace json_clases
    {
        public class USER
        {
            public int id { get; set; }
            public string first_name { get; set; }
            public string last_name { get; set; }
            public string photo_100 { get; set; }
            public string photo_50 { get; set; }
        }

        public class USER_INFO
        {
            public List<USER> response { get; set; }
        }
        public class TOKEN_DATA
        {
            public string access_token { get; set; }
            public int expires_in { get; set; }
            public int user_id { get; set; }
        }
    }
    
}
