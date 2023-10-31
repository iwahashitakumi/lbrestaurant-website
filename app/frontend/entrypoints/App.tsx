import React, { useState } from 'react';
import ReactDOM from 'react-dom/client'
import Header from '../src/Header'
import Sidebar from '../src/Sidebar'

function App() {
  const [isSidebarOpen, setSidebarOpen] = useState(false);

  const toggleSidebar = () => {
    setSidebarOpen(!isSidebarOpen);
  };
  const headerElement = document.getElementById('header');
  if (headerElement) {
    ReactDOM.createRoot(headerElement).render(
      <React.StrictMode>
        <Header
          usersRootPath="/users"
          editUserRegistrationPath="/users/edit"
          destroyUserSessionPath="/users/sign_out"
          isSidebarOpen={isSidebarOpen}
          toggleSidebar={toggleSidebar}
        />
      </React.StrictMode>
    );
  }

  const sidebarElement = document.getElementById('sidebar');
  if (sidebarElement) {
    ReactDOM.createRoot(sidebarElement).render(
      <React.StrictMode>
        <Sidebar isSidebarOpen={isSidebarOpen} />
      </React.StrictMode>
    );
  }
}
export default App;
