import React from 'react';
import {useState} from 'react';
import {rewrap} from "@sonicgarden/rewrap";
import ContactMethod from '../src/ContactMethod';
import PublicHeader from '../src/PublicHeader'


const element = document.getElementById('header');
const App: React.FC = (props: any) => {
  React.useEffect(() => {
    rewrap('contactmethod-component', ContactMethod, true);
  }, []);

  return <>
    <PublicHeader
      RootPath="/"
      CompaniesPath="/companies"
      NewsPath="/news"
      ArticlesPath="/articles"
      ShopsPath="/shops"
      JobEntriesPath="/job_entries"
      JobEntriesRecruitmentPath="/job_entries/recruitment_info"
      JobEntriesFaqPath="/job_entries/faq"
      ContactsNewPath="/contacts/new"
      ControllerName={props.ControllerName}
      ActionName={props.ActionName}
    ></PublicHeader>
    <main>
      {props.children}
    </main>
  </>
}

rewrap('app-component', App, true)
