using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AspProject.Startup))]
namespace AspProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
