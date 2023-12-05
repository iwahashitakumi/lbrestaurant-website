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
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
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
      editAdminRegistrationPath="/admins/edit"
      destroyAdminSessionPath="/admins/sign_out"
      toggleSidebar={toggleSidebar}
    ></Header>
    <div className="container-fluid mobile-gutter">
      <div className="row mobile-gutter">
        <Sidebar
         isSidebarOpen={isSidebarOpen}
         adminsNewsIndexPath="/admins/news"
         newAdminsNewsPath="/admins/news/new"
         adminsArticlesPath="/admins/articles"
         newAdminsArticlesPath="/admins/articles/new"
         adminsShopsPath="/admins/shops"
         discardedAdminsShopsPath="/admins/shops/discarded"
         newAdminsShopsPath="/admins/shops/new"
         ></Sidebar>
        <main className={`${isSidebarOpen ? 'ml-sm-auto col-lg-10 col-md-9' : ''}  px-md-4 py-md-4 main-top`}>
          {props.children}
        </main>
      </div>
    </div>
  </>
}

rewrap('app-component', App, true)
