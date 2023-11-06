import React from 'react';

interface HeaderProps {
  usersRootPath: string;
  editUserRegistrationPath: string;
  destroyUserSessionPath: string;
  isSidebarOpen: boolean;
  toggleSidebar: () => void;
}

const Header: React.FC<HeaderProps> = (props) => {
  return (
    <header>
      <nav className="navbar navbar-expand navbar-dark bg-dark">
        <a href={props.usersRootPath} className="navbar-brand ps-3 ms-lg-5">
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
                <a href={props.editUserRegistrationPath} className="dropdown-item">
                  アカウント設定
                </a>
              </li>
              <li>
                <a
                  href={props.destroyUserSessionPath}
                  className="dropdown-item"
                  data-method="delete"
                  data-confirm="ログアウトしますか？"
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