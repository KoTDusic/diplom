using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ElectronDecanat.Startup))]
namespace ElectronDecanat
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
