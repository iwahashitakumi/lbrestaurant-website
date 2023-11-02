import React from 'react';
import {useState} from 'react';
import Header from '../src/Header'
import Sidebar from '../src/Sidebar'
import {rewrap} from "@sonicgarden/rewrap";

const element = document.getElementById('header');
const App: React.FC = (props: any) => {
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
      usersRootPath={props.usersRootPath}
      editUserRegistrationPath={props.editUserRegistrationPath}
      destroyUserSessionPath={props.destroyUserSessionPath}
      toggleSidebar={toggleSidebar}
    ></Header>
    <div className="container-fluid">
      <div className="row">
        <Sidebar isSidebarOpen={isSidebarOpen} />
        <main className={`col-md-9 ${isSidebarOpen ? 'ml-sm-auto' : ''} col-lg-10 px-md-4 py-4`}>
          {props.children}
        </main>
      </div>
    </div>
  </>
}

rewrap('app-component', App, true)
