using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web;
using KanrishaEF;
using WebMatrix.WebData;
using System.Web.Security;

namespace Kanrish.Core.Entensions
{
    public static class HtmlHelperExtension
    {
        public static MvcHtmlString NavigationMenu(this HtmlHelper helper)
        {
            HttpContext context = HttpContext.Current;
            TB_UserProfile role = (TB_UserProfile)context.Session["UserSession"];
            StringBuilder navigationBuilder = new StringBuilder();
            if (role != null)
            {
                

                navigationBuilder.Append("<aside class=\"sidebar\">");
                navigationBuilder.Append("<ul class=\"tab_nav\">");
                navigationBuilder.Append("<li class=\"active_tab i_32_dashboard\"><a href=\"index.html\" title=\"General Info\"><span class=\"tab_label\">Main</span><span class=\"tab_info\">General Info</span></a></li>");
                navigationBuilder.Append("<li class=\"i_32_inbox\"><a href=\"inbox.html\" title=\"Your Messages\"><span class=\"tab_label\">Condominium</span><span class=\"tab_info\">Your Messages</span></a></li>");
                if (role.TB_Role.Role.Equals("admin", StringComparison.InvariantCultureIgnoreCase))
                {
                    navigationBuilder.Append("<li class=\"i_32_charts\"><a href=\"charts.html\" title=\"Visual Data\"><span class=\"tab_label\">Faraction</span><span class=\"tab_info\">Visual Data</span></a></li>");
                    navigationBuilder.Append("<li class=\"i_32_ui\"><a href=\"ui.html\" title=\"Kit elements\"><span class=\"tab_label\">Suppliers</span><span class=\"tab_info\">Kit elements</span></a></li>");
                    navigationBuilder.Append("<li class=\"i_32_tables\"><a href=\"tables.html\" title=\"Some Rows\"><span class=\"tab_label\">Maintenance</span><span class=\"tab_info\">Some Rows</span></a></li>");
                    navigationBuilder.Append("<li class=\"i_32_forms\"><a href=\"forms.html\" title=\"Some Fields\"><span class=\"tab_label\">Management</span><span class=\"tab_info\">Some Fields</span></a></li>");
                    navigationBuilder.Append("<li class=\"i_32_forms\"><a href=\"forms.html\" title=\"Some Fields\"><span class=\"tab_label\">Admin</span><span class=\"tab_info\">Some Fields</span></a></li>");
                }
                navigationBuilder.Append("</ul></aside>");
            }
            else
            {
                FormsAuthentication.SignOut();
            }

            return new MvcHtmlString(navigationBuilder.ToString());

        }
    }
}
