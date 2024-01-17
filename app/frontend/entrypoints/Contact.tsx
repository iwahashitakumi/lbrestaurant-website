import React from 'react';
import {rewrap} from "@sonicgarden/rewrap";
import ContactMethod from '../src/ContactMethod';


const Contact: React.FC = (props: any) => {
  return (
    <div>
      <ContactMethod
        contactMethodValuesCollect={props.contactMethodValuesCollect}
        contactMethod={props.contactMethod}
      ></ContactMethod>
    </div>
  );
}

rewrap('contact-component', Contact, true)
