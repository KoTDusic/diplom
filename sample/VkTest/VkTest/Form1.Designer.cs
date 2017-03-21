namespace VkTest
{
    partial class Form1
    {
        /// <summary>
        /// Требуется переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Обязательный метод для поддержки конструктора - не изменяйте
        /// содержимое данного метода при помощи редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.authBtn = new System.Windows.Forms.Button();
            this.Avatar = new System.Windows.Forms.PictureBox();
            this.TextId = new System.Windows.Forms.TextBox();
            this.TextFirst_name = new System.Windows.Forms.TextBox();
            this.TextLast_name = new System.Windows.Forms.TextBox();
            this.dialog_list = new System.Windows.Forms.DataGridView();
            this.dialogsProgress = new System.Windows.Forms.ProgressBar();
            this.dialogs_data = new System.Data.DataSet();
            this.dataTable1 = new System.Data.DataTable();
            this.dataColumn1 = new System.Data.DataColumn();
            this.dataColumn2 = new System.Data.DataColumn();
            this.dataColumn3 = new System.Data.DataColumn();
            this.dataColumn4 = new System.Data.DataColumn();
            ((System.ComponentModel.ISupportInitialize)(this.Avatar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dialog_list)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dialogs_data)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataTable1)).BeginInit();
            this.SuspendLayout();
            // 
            // authBtn
            // 
            this.authBtn.Location = new System.Drawing.Point(13, 13);
            this.authBtn.Name = "authBtn";
            this.authBtn.Size = new System.Drawing.Size(104, 23);
            this.authBtn.TabIndex = 0;
            this.authBtn.Text = "Авторизоваться";
            this.authBtn.UseVisualStyleBackColor = true;
            this.authBtn.Click += new System.EventHandler(this.authBtn_Click);
            // 
            // Avatar
            // 
            this.Avatar.Enabled = false;
            this.Avatar.ImageLocation = "";
            this.Avatar.Location = new System.Drawing.Point(13, 42);
            this.Avatar.Name = "Avatar";
            this.Avatar.Size = new System.Drawing.Size(100, 100);
            this.Avatar.TabIndex = 2;
            this.Avatar.TabStop = false;
            // 
            // TextId
            // 
            this.TextId.Enabled = false;
            this.TextId.Location = new System.Drawing.Point(13, 148);
            this.TextId.Name = "TextId";
            this.TextId.ReadOnly = true;
            this.TextId.Size = new System.Drawing.Size(150, 20);
            this.TextId.TabIndex = 3;
            // 
            // TextFirst_name
            // 
            this.TextFirst_name.Enabled = false;
            this.TextFirst_name.Location = new System.Drawing.Point(13, 174);
            this.TextFirst_name.Name = "TextFirst_name";
            this.TextFirst_name.ReadOnly = true;
            this.TextFirst_name.Size = new System.Drawing.Size(150, 20);
            this.TextFirst_name.TabIndex = 3;
            // 
            // TextLast_name
            // 
            this.TextLast_name.Enabled = false;
            this.TextLast_name.Location = new System.Drawing.Point(13, 200);
            this.TextLast_name.Name = "TextLast_name";
            this.TextLast_name.ReadOnly = true;
            this.TextLast_name.Size = new System.Drawing.Size(150, 20);
            this.TextLast_name.TabIndex = 3;
            // 
            // dialog_list
            // 
            this.dialog_list.AllowUserToAddRows = false;
            this.dialog_list.AllowUserToDeleteRows = false;
            this.dialog_list.AllowUserToResizeColumns = false;
            this.dialog_list.AllowUserToResizeRows = false;
            this.dialog_list.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dialog_list.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dialog_list.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dialog_list.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dialog_list.ClipboardCopyMode = System.Windows.Forms.DataGridViewClipboardCopyMode.EnableWithoutHeaderText;
            this.dialog_list.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dialog_list.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dialog_list.Location = new System.Drawing.Point(169, 42);
            this.dialog_list.MultiSelect = false;
            this.dialog_list.Name = "dialog_list";
            this.dialog_list.ReadOnly = true;
            this.dialog_list.RowHeadersVisible = false;
            this.dialog_list.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            this.dialog_list.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.dialog_list.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dialog_list.ShowCellErrors = false;
            this.dialog_list.ShowCellToolTips = false;
            this.dialog_list.ShowEditingIcon = false;
            this.dialog_list.ShowRowErrors = false;
            this.dialog_list.Size = new System.Drawing.Size(828, 298);
            this.dialog_list.TabIndex = 4;
            this.dialog_list.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dialog_list_CellDoubleClick);
            this.dialog_list.Scroll += new System.Windows.Forms.ScrollEventHandler(this.dialog_list_Scroll);
            // 
            // dialogsProgress
            // 
            this.dialogsProgress.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dialogsProgress.Location = new System.Drawing.Point(170, 16);
            this.dialogsProgress.Name = "dialogsProgress";
            this.dialogsProgress.Size = new System.Drawing.Size(827, 23);
            this.dialogsProgress.Step = 1;
            this.dialogsProgress.TabIndex = 5;
            this.dialogsProgress.Visible = false;
            // 
            // dialogs_data
            // 
            this.dialogs_data.DataSetName = "NewDataSet";
            this.dialogs_data.Tables.AddRange(new System.Data.DataTable[] {
            this.dataTable1});
            // 
            // dataTable1
            // 
            this.dataTable1.Columns.AddRange(new System.Data.DataColumn[] {
            this.dataColumn1,
            this.dataColumn2,
            this.dataColumn3,
            this.dataColumn4});
            this.dataTable1.TableName = "dialogs_list";
            // 
            // dataColumn1
            // 
            this.dataColumn1.ColumnName = "фото";
            this.dataColumn1.DataType = typeof(byte[]);
            // 
            // dataColumn2
            // 
            this.dataColumn2.ColumnName = "имя";
            // 
            // dataColumn3
            // 
            this.dataColumn3.ColumnName = "сообщение";
            // 
            // dataColumn4
            // 
            this.dataColumn4.ColumnName = "ид";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1009, 352);
            this.Controls.Add(this.dialogsProgress);
            this.Controls.Add(this.dialog_list);
            this.Controls.Add(this.TextLast_name);
            this.Controls.Add(this.TextFirst_name);
            this.Controls.Add(this.TextId);
            this.Controls.Add(this.Avatar);
            this.Controls.Add(this.authBtn);
            this.Name = "Form1";
            this.Text = "VkTest";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.Move += new System.EventHandler(this.Form1_Move);
            this.Resize += new System.EventHandler(this.Form1_Resize);
            ((System.ComponentModel.ISupportInitialize)(this.Avatar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dialog_list)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dialogs_data)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataTable1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button authBtn;
        private System.Windows.Forms.PictureBox Avatar;
        private System.Windows.Forms.TextBox TextId;
        private System.Windows.Forms.TextBox TextFirst_name;
        private System.Windows.Forms.TextBox TextLast_name;
        private System.Windows.Forms.DataGridView dialog_list;
        private System.Windows.Forms.ProgressBar dialogsProgress;
        private System.Data.DataSet dialogs_data;
        private System.Data.DataTable dataTable1;
        private System.Data.DataColumn dataColumn1;
        private System.Data.DataColumn dataColumn2;
        private System.Data.DataColumn dataColumn3;
        private System.Data.DataColumn dataColumn4;
    }
}

