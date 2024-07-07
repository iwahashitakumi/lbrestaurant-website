import React, { useState, useEffect } from 'react';

interface ContactMethodProps {
  contactMethodValuesCollect: string[];
  contactMethod: string; 
}

const ContactMethod: React.FC<ContactMethodProps> = (props) => {
  const { contactMethodValuesCollect, contactMethod } = props;
  const [selectedOption, setSelectedOption] = useState<string | null>(contactMethod || null);

  useEffect(() => {
    setSelectedOption(contactMethod || null);
  }, [contactMethod]);

  const handleOptionChange = (value: string) => {
    setSelectedOption(value);
  };

  const handleClearSelection = () => {
    setSelectedOption(null);
  };

  const optionTextMap: Record<string, string> = {
    'email': 'メールアドレス',
    'phone_number': '電話番号',
  };

  return (
    <React.Fragment>
      <div className="contact-form">
        {contactMethodValuesCollect.map((option: string, index: number) => (
          <div key={option} className="form-check contact-as-radio form-text">
            <input
              type="radio"
              id={option}
              name="contact[contact_method]"
              value={option}
              checked={selectedOption === option}
              onChange={() => handleOptionChange(option)}
              className="form-check-input"
            />
            <label htmlFor={option} className="form-check-label" lang="ja">
              {optionTextMap[option]}
            </label>
          </div>
        ))}
      
        {selectedOption && (
          <div>
            <a className="text-decoration-underline" type="button" onClick={handleClearSelection}>
              選択解除
            </a>
          </div>
        )}
      </div>
    </React.Fragment>
  );
};

export default ContactMethod;
