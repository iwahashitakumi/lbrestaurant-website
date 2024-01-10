import React, { useState } from 'react';

interface ContactMethodProps {
  contactMethodValuesCollect: string[];
}

const ContactMethod: React.FC<ContactMethodProps> = (props) => {
  const { contactMethodValuesCollect } = props;

  const [selectedOption, setSelectedOption] = useState<string | null>(null);

  const handleOptionChange = (value: string) => {
    setSelectedOption(value);
  };

  const handleClearSelection = () => {
    setSelectedOption(null);
  };

  return (
    <React.Fragment>
      <th className="col-md-4">
        <div className="contact-label">
          連絡方法
          <span className="badge rounded-pill text-bg-success">任意</span>
        </div>
      </th>
      <td className="col-md-8">
        <div className="contact-form">
          {contactMethodValuesCollect.map((option: string, index: number) => (
            <div key={option} className="form-check contact-as-radio">
              <input
                type="radio"
                id={option}
                name={`contact_method_${index}`}
                value={option}
                checked={selectedOption === option}
                onChange={() => handleOptionChange(option)}
                className="form-check-input"
              />
              <label htmlFor={option} className="form-check-label">
                {option}
              </label>
            </div>
          ))}
        </div>

        {selectedOption && (
          <div>
            <a className="text-decoration-underline" type="button" onClick={handleClearSelection}>
              選択解除
            </a>
          </div>
        )}
      </td>
      </React.Fragment>
  );
};

export default ContactMethod;
