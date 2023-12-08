import React from 'react';

interface SidebarProps {
  adminsNewsIndexPath: string;
  newAdminsNewsPath: string;
  adminsArticlesPath: string;
  newAdminsArticlesPath: string;
  adminsShopsPath: string;
  discardedAdminsShopsPath: string;
  newAdminsShopsPath: string;
  adminsAdminUsersPath: string;
  newAdminsAdminUsersPath: string;
  isSidebarOpen: boolean;
}

const Sidebar: React.FC<SidebarProps> = (props) => {
  console.log(`[Sidebar]isSidebarOpenの値は${props.isSidebarOpen}です。`);
  return (
    <nav id="sidebar" className={`col-md-3 col-lg-2 bg-light sidebar `} style={{display: props.isSidebarOpen ? 'block' : 'none'}}>
      <div className="flex-shrink-0 p-3 bg-dark" style={{ height: '100%' }}>
        <a href="/" className="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
          <span className="fs-5 fw-semibold text-white mx-auto">ダッシュボード</span>
        </a>
        <ul className="list-unstyled ps-0">
          <li className="mb-1">
            <button className="btn btn-toggle d-inline-flex align-items-center rounded border-0 text-white" data-bs-toggle="collapse" data-bs-target="#news-collapse" aria-expanded="true">
              お知らせ
            </button>
            <div className="collapse show" id="news-collapse">
              <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href={props.adminsNewsIndexPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">一覧</a></li>
                <li><a href={props.newAdminsNewsPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">新規作成</a></li>
              </ul>
            </div>
          </li>
          <li className="mb-1">
          <button className="btn btn-toggle d-inline-flex align-items-center rounded border-0 text-white" data-bs-toggle="collapse" data-bs-target="#article-collapse" aria-expanded="false">
              ブログ
            </button>
            <div className="collapse" id="article-collapse">
              <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href={props.adminsArticlesPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">一覧</a></li>
                <li><a href={props.newAdminsArticlesPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">新規作成</a></li>
              </ul>
            </div>
          </li>
          <li className="mb-1">
            <button className="btn btn-toggle d-inline-flex align-items-center rounded border-0 text-white" data-bs-toggle="collapse" data-bs-target="#shop-collapse" aria-expanded="false">
              店舗
            </button>
            <div className="collapse" id="shop-collapse">
              <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href={props.adminsShopsPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">一覧</a></li>
                <li><a href={props.discardedAdminsShopsPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">削除一覧</a></li>
                <li><a href={props.newAdminsShopsPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">新規作成</a></li>
              </ul>
            </div>
          </li>
          <li className="border-top my-3"></li>
          <li className="mb-1">
            <button className="btn btn-toggle d-inline-flex align-items-center rounded border-0 text-white" data-bs-toggle="collapse" data-bs-target="#admin-user-collapse" aria-expanded="false">
              アカウント
            </button>
            <div className="collapse" id="admin-user-collapse">
              <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href={props.adminsAdminUsersPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">管理ユーザー一覧</a></li>
                <li><a href={props.newAdminsAdminUsersPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">管理ユーザ新規作成</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </nav>
  );
}

export default Sidebar;
