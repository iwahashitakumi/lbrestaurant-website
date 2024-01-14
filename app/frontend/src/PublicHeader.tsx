import React, { useState } from 'react';

interface PublicHeaderProps {
  RootPath: string;
  CompaniesPath: string;
  NewsPath: string;
  ArticlesPath: string;
  ShopsPath: string;
  JobEntriesPath: string;
  JobEntriesRecruitmentPath: string;
  JobEntriesFaqPath: string;
  ContactsNewPath: string;
  ControllerName: string;
  ActionName: string;
}

const PublicHeader: React.FC<PublicHeaderProps> = (props) => {
  const [isDropdownVisible, setDropdownVisible] = useState(false);

  const isActive = (expectedController: string, expectedAction: string): string => {
    return (
      props.ControllerName === expectedController &&
      [expectedAction].includes(props.ActionName)
    )
      ? 'active'
      : '';
  };

  const handleMouseEnter = () => {
    setDropdownVisible(true);
  };

  const handleMouseLeave = () => {
    setDropdownVisible(false);
  };

  return (
    <header className="header fixed-top" onMouseLeave={handleMouseLeave}>
      <nav className="navbar navbar-expand-lg navbar-light bg-white align-items-center">
        <div className="header-sm">
          <a href={props.RootPath} className="navbar-brand navbar-brand-sm fw-bold logo header-mobile-text">
            LBrestaurant
          </a>
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
        </div>
        <div className="header-linklist collapse navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav ms-auto">
            <li className={`nav-item ${isActive('companies', 'show')} ms-5`}>
              <a href={props.CompaniesPath} className={`nav-link fw-bold ${isActive('companies', 'show')}`}>
                会社情報
              </a>
            </li>
            <li className={`nav-item ${isActive('shops', 'index')} ms-5`}>
              <a href={props.ShopsPath} className={`nav-link fw-bold ${isActive('shops', 'index')}`}>
                店舗情報
              </a>
            </li>
            <li className={`nav-item ${isActive('news', 'show') || isActive('news', 'index')} ms-5`}>
              <a href={props.NewsPath} className={`nav-link fw-bold ${isActive('news', 'show') || isActive('news', 'index')}`}>
                お知らせ
              </a>
            </li>
            <li className={`nav-item ${isActive('articles', 'show') || isActive('articles', 'index')} ms-5`}>
              <a href={props.ArticlesPath} className={`nav-link fw-bold ${isActive('articles', 'show') || isActive('articles', 'index')}`}>
                ブログ
              </a>
            </li>
            <li className={`recruit-drop nav-item dropdown ms-5`} onMouseEnter={handleMouseEnter}>
              <a
                href={props.JobEntriesPath}
                className={`nav-link fw-bold ${isActive('job_entries', 'show') || isActive('job_entries', 'recruitment_info') || isActive('job_entries', 'confirm') || isActive('job_entries', 'complete') || isActive('job_entries', 'faq')}`}
              >
                採用情報
              </a>
              <div
                className={`dropdown-menu ${isDropdownVisible ? 'show' : ''}`}
                id="jobEntriesDropdown"
              >
                <a className="dropdown-item drop-top-line" href={props.JobEntriesRecruitmentPath}>
                  応募はこちら
                </a>
                <a className="dropdown-item drop-top-line drop-bottom-line" href={props.JobEntriesFaqPath}>
                  よくある問い合わせ
                </a>
              </div>
            </li>
            <li className={`nav-item ${isActive('contacts', 'new') || isActive('contacts', 'confirm') || isActive('contacts', 'complete')} ms-5`}>
              <a href={props.ContactsNewPath} className={`nav-link fw-bold ${isActive('contacts', 'new') || isActive('contacts', 'confirm') || isActive('contacts', 'complete')}`}>
                問い合わせ
              </a>
            </li>
          </ul>
        </div>
      </nav>
    </header>
  );
};

export default PublicHeader;
