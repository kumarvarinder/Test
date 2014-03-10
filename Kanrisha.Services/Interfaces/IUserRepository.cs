using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using KanrishaEF;

namespace Kanrisha.Services.Interfaces
{
    public interface IUserRepository
    {
         TB_UserProfile login(string userName, string password);

    }
}
