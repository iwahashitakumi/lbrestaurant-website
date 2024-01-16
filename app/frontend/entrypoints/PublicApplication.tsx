import React from 'react';
import {rewrap} from "@sonicgarden/rewrap";
import ContactMethod from '../src/ContactMethod';



const App: React.FC = (props: any) => {
  React.useEffect(() => {
    rewrap('contactmethod-component', ContactMethod, true);
  }, []);

  return <>
    <main>
      {props.children}
    </main>
  </>
}

rewrap('app-component', App, true)
