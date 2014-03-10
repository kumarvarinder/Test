using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using KanrishaEF;
using Kanrisha.Services.Interfaces;

namespace Kanrisha.Services.Respository
{
    public class UserRepository : IUserRepository
    {
        KanrishaEntities entities = new KanrishaEntities();

        public TB_UserProfile login(string userName, string password)
        {
            TB_User user= entities.TB_User.Where(u => u.UserName.Equals(userName) && u.Password.Equals(password)).SingleOrDefault();
            if(user!=null)
            {
                return user.TB_UserProfile.SingleOrDefault();
            }
            return null;            
        }
    }
}
