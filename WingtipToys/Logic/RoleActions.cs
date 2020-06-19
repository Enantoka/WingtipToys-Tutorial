using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WingtipToys.Models;

namespace WingtipToys.Logic
{
    internal class RoleActions
    {
        internal void CreateAdmin()
        {
            // Access the application context and create result variables
            Models.ApplicationDbContext context = new Models.ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            /* Create a RoleStore object by using the ApplicationDbContext
            ** The RoleStore is only allowed to contain IdentityRole objects
            */
            var roleStore = new RoleStore<IdentityRole>(context);

            /* Create a RoleManager object that is only allowed to contain IdentityRole objects
            ** When creating the RoleManager object, pass in the new RoleStore object as the parameter
             */
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // Create the "Administrator" role if it doesn't already exist
            if (!roleMgr.RoleExists("Administrator"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole("Administrator"));
                if (!IdRoleResult.Succeeded)
                {
                    // Handle the error condition if there's a problem creating the RoleManager object
                }
            }

            // Create a UserManager object based on the UserStore object and the ApplicationDbContext
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser()
            {
                UserName = "Admin@live.com",
            };
            IdUserResult = userMgr.Create(appUser, "Pa$$word");

            // If the new "Admin" user was succesfully created, add the "Admin" to the "Administrator" role
            if (IdUserResult.Succeeded)
            {
                IdUserResult = userMgr.AddToRole(appUser.Id, "Administrator");
                if (!IdUserResult.Succeeded)
                {
                    // Handle the error condition if there's a problem adding the user to the role
                }
            }
            else
            {
                // Handle the error condition if there's a problem creating the new user
            }
        }
    }
}