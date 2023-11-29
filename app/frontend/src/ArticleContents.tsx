import React, { useState } from 'react';

interface ContentsFormProps {
  index: number;
  totalContents: number;
  content: {
    body: string;
    article_images: File | null;
    article_images_cache: string;
    errors: { body?: string[]; article_images?: string[] };
  };
  onRemove: () => void;
  onChange: (key: string, value: string | File | null) => void;
}

const ContentsForm: React.FC<ContentsFormProps> = ({ index, totalContents, content, onRemove, onChange }) => {
  const handleInputChange = (key: string, e: React.ChangeEvent<HTMLInputElement>) => {
    onChange(key, e.target.value);
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0] || null;
    onChange('article_images', file);
  };

  return (
    <div className="mb-4">
      <label htmlFor={`contents_${index}_body`} className="form-label">
        内容{index + 1}
      </label>
      <span className="badge rounded-pill text-bg-danger">必須</span>
      <textarea
        id={`contents_${index}_body`}
        name={`article[contents_attributes][${index}][body]`}
        value={content.body}
        onChange={(e) => handleInputChange('body', e)}
        className="form-control"
      />
      
      {content.errors.body && content.errors.body.map((error, errorIndex) => (
        <div key={`body_error_${index}_${errorIndex}`} className="text-danger">
          {error}
        </div>
      ))}

      <label htmlFor={`contents_${index}_article_images`} className="form-label">
        画像{index + 1}
      </label>
      <span className="badge rounded-pill text-bg-success">任意</span>
      <input
        type="file"
        id={`contents_${index}_article_images`}
        name={`article[contents_attributes][${index}][article_images]`}
        onChange={handleFileChange}
        className="form-control"
        accept="image/*"
      />
      <input
        type="hidden"
        id={`contents_${index}_article_images_cache`}
        name={`article[contents_attributes][${index}][article_images_cache]`}
        value={content.article_images_cache || ''}
      />
      {content.errors.article_images && content.errors.article_images.map((error, errorIndex) => (
        <div key={`article_images_error_${index}_${errorIndex}`} className="text-danger">
          {error}
        </div>
      ))}

      {totalContents > 1 && index === totalContents - 1 && (
        <button type="button" onClick={onRemove} className="btn btn-danger">
          -
        </button>
      )}
    </div>
  );
};

const ArticleContents: React.FC = () => {
  const initialContent = {
    body: '',
    article_images: null,
    article_images_cache: '',
    errors: {},
  };

  const [contents, contentContents] = useState([initialContent]);

  const handleAddContent = () => {
    contentContents([...contents, initialContent]);
  };

  const handleRemoveContent = (index: number) => {
    if (index === 0 && contents.length === 1) {
      return;
    }
    const newContents = [...contents];
    newContents.splice(index, 1);
    contentContents(newContents);
  };

  const handleContentChange = (index: number, key: string, value: string | File | null) => {
    const newContents = [...contents];
    newContents[index] = { ...newContents[index], [key]: value, errors: {} };
    contentContents(newContents);
  };

  return (
    <form>
      {contents.map((content, index) => (
        <ContentsForm
          key={index}
          index={index}
          totalContents={contents.length}
          content={content}
          onRemove={() => handleRemoveContent(index)}
          onChange={(key, value) => handleContentChange(index, key, value)}
        />
      ))}
      <button type="button" onClick={handleAddContent} className="btn btn-primary">
        +
      </button>
    </form>
  );
};

export default ArticleContents;
