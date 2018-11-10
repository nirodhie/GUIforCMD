using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUIforCMD
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            
           label1.Text = RunPowerShellScript("GetIP.ps1");
           label2.Text = RunPowerShellScript("WindowsInstallDate.ps1");
           label6.Text = RunPowerShellScript("upTime.ps1");
           label8.Text = RunPowerShellScript("HDDcapacity.ps1");


        }

        public string RunPowerShellScript(string scriptName)
        {
            Process proces_uruchamiajacy_komende = new Process();
            proces_uruchamiajacy_komende.StartInfo.UseShellExecute = false;
            proces_uruchamiajacy_komende.StartInfo.CreateNoWindow = true;
            proces_uruchamiajacy_komende.StartInfo.RedirectStandardOutput = true;
            proces_uruchamiajacy_komende.StartInfo.FileName = "RunPowershell.bat";
            proces_uruchamiajacy_komende.StartInfo.Arguments = scriptName;
            proces_uruchamiajacy_komende.Start();
            //proces_uruchamiajacy_komende.WaitForExit();
            proces_uruchamiajacy_komende.WaitForExit();

            var wynik = proces_uruchamiajacy_komende.StandardOutput.ReadToEnd();
            
            return wynik.Trim();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }
    }
}
