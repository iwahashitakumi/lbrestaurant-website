import React from 'react';

interface SidebarProps {
  adminsNewsIndexPath: string;
  newAdminsNewsPath: string;
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
            <button className="btn btn-toggle d-inline-flex align-items-center rounded border-0 text-white" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
              お知らせ
            </button>
            <div className="collapse show" id="home-collapse">
              <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href={props.adminsNewsIndexPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">一覧</a></li>
                <li><a href={props.newAdminsNewsPath} className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">新規作成</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">レポート</a></li>
              </ul>
            </div>
          </li>
          <li className="mb-1">
            <button className="btn btn-toggle d-inline-flex align-items-center rounded border-0 text-white" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
              ダッシュボード
            </button>
            <div className="collapse" id="dashboard-collapse">
              <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">概要</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">毎週</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">毎月</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">毎年</a></li>
              </ul>
            </div>
          </li>
          <li className="mb-1">
            <button className="btn btn-toggle d-inline-flex align-items-center rounded border-0 text-white" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              注文
            </button>
            <div className="collapse" id="orders-collapse">
              <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">新品</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">処理済み</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">出荷済み</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">返品</a></li>
              </ul>
            </div>
          </li>
          <li className="border-top my-3"></li>
          <li className="mb-1">
            <button className="btn btn-toggle d-inline-flex align-items-center rounded border-0 text-white" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
              アカウント
            </button>
            <div className="collapse" id="account-collapse">
              <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">新プロジェクト...</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">プロフィール</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">設定</a></li>
                <li><a href="#" className="link-body-emphasis d-inline-flex text-decoration-none rounded text-white">サインアウト</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </nav>
  );
}

export default Sidebar;
