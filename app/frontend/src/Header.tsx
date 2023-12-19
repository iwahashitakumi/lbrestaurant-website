import React from 'react';

interface HeaderProps {
  adminsRootPath: string;
  destroyAdminSessionPath: string;
  isSidebarOpen: boolean;
  currentAdmin: {
    currentAdminName: string;
    currentAdminRole: string;
  };
  toggleSidebar: () => void;
}

const Header: React.FC<HeaderProps> = (props) => {
  console.log(props.currentAdmin);
  const handleLogoutClick = (e: React.MouseEvent<HTMLAnchorElement>) => {
    const confirmLogout = window.confirm('本当にログアウトしますか？');
    if (!confirmLogout) {
      e.preventDefault();
    }
  };

  return (
    <header className="admin-header">
      <nav className="navbar navbar-expand navbar-dark bg-dark">
        <a href={props.adminsRootPath} className="navbar-brand ps-3 ms-lg-5 mobile-text">
          LBrestaurant管理システム
        </a>
        <button
          id="sidebar-toggle-button"
          className="navbar-toggler"
          type="button"
          onClick={props.toggleSidebar}
        >
          <span className="navbar-toggler-icon"></span>
        </button>
        <ul className="navbar-nav ms-auto me-lg-5">
          <li className="nav-item dropdown">
            <a
              className="nav-link dropdown-toggle"
              id="navbarDropdown"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <svg
                className="svg-inline--fa fa-user fa-fw"
                style={{ width: '24px', height: '24px' }}
                aria-hidden="true"
                focusable="false"
                data-prefix="fas"
                data-icon="user"
                role="img"
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 448 512"
                data-fa-i2svg=""
              >
                <path fill="currentColor" d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"></path>
              </svg>
            </a>
            <ul className="dropdown-menu dropdown-menu-end position-absolute" aria-labelledby="navbarDropdown">
              <li>
                <div className="dropdown-item">
                {props.currentAdmin.currentAdminRole}
                </div>
              </li>
              <li>
                <div className="dropdown-item">
                {props.currentAdmin.currentAdminName}
                </div>
              </li>
              <li>
                <a
                  href={props.destroyAdminSessionPath}
                  className="dropdown-item"
                  data-method="delete"
                  onClick={handleLogoutClick}
                >
                  ログアウト
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
    </header>
  );
}

export default Header;
