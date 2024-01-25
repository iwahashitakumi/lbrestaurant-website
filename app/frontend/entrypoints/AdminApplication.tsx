import React from 'react';
import {useState} from 'react';
import Header from '../src/Header'
import Sidebar from '../src/Sidebar'
import {rewrap} from "@sonicgarden/rewrap";
import ArticleContents from "../src/ArticleContents";


const element = document.getElementById('header');
const App: React.FC = (props: any) => {
  React.useEffect(() => {
    rewrap('articlecontents-component', ArticleContents, true);
  }, []);
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const toggleSidebar = React.useCallback(() => {
    if (isSidebarOpen) {
      setIsSidebarOpen(false);
    } else {
      setIsSidebarOpen(true);
    }
  }, [isSidebarOpen]);

  return <>
    <Header
      adminsRootPath="/admins"
      destroyAdminSessionPath="/admins/sign_out"
      currentAdmin={props.currentAdmin}
      toggleSidebar={toggleSidebar}
    ></Header>
    <div className="container-fluid mobile-gutter">
      <div className="row mobile-gutter">
        <Sidebar
          currentAdminRole={props.currentAdminRole}
          adminsContactsPath="/admins/contacts"
          adminsJobEntriesPath="/admins/job_entries"
          isSidebarOpen={isSidebarOpen}
          adminsNewsIndexPath="/admins/news"
          newAdminsNewsPath="/admins/news/new"
          adminsArticlesPath="/admins/articles"
          newAdminsArticlesPath="/admins/articles/new"
          adminsShopsPath="/admins/shops"
          discardedAdminsShopsPath="/admins/shops/discarded"
          newAdminsShopsPath="/admins/shops/new"
          newAdminsAdminUsersPath="/admins/admin_users/new"
          adminsAdminUsersPath="/admins/admin_users"
         ></Sidebar>
        <main className={`${isSidebarOpen ? 'ml-sm-auto col-lg-10 col-md-9' : ''}  p-md-4 p-3 main-top`}>
          {props.children}
        </main>
      </div>
    </div>
  </>
}

rewrap('app-component', App, true)
