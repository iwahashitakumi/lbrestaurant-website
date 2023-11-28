import React, { useState } from 'react';

interface SetsFormProps {
  index: number;
  totalSets: number;
  set: {
    body: string;
    article_images: File | null;
    article_images_cache: string;
    errors: { body?: string[]; article_images?: string[] };
  };
  onRemove: () => void;
  onChange: (key: string, value: string | File | null) => void;
}

const SetsForm: React.FC<SetsFormProps> = ({ index, totalSets, set, onRemove, onChange }) => {
  const handleInputChange = (key: string, e: React.ChangeEvent<HTMLInputElement>) => {
    onChange(key, e.target.value);
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0] || null;
    onChange('article_images', file);
  };

  return (
    <div className="mb-4">
      <label htmlFor={`sets_${index}_body`} className="form-label">
        内容{index + 1}
      </label>
      <span className="badge rounded-pill text-bg-danger">必須</span>
      <textarea
        id={`sets_${index}_body`}
        name={`article[sets_attributes][${index}][body]`}
        value={set.body}
        onChange={(e) => handleInputChange('body', e)}
        className="form-control"
      />
      {/* エラーメッセージの表示 */}
      {set.errors.body && set.errors.body.map((error, errorIndex) => (
        <div key={`body_error_${index}_${errorIndex}`} className="text-danger">
          {error}
        </div>
      ))}

      <label htmlFor={`sets_${index}_article_images`} className="form-label">
        画像{index + 1}
      </label>
      <span className="badge rounded-pill text-bg-success">任意</span>
      <input
        type="file"
        id={`sets_${index}_article_images`}
        name={`article[sets_attributes][${index}][article_images]`}
        onChange={handleFileChange}
        className="form-control"
        accept="image/*"
      />
      <input
        type="hidden"
        id={`sets_${index}_article_images_cache`}
        name={`article[sets_attributes][${index}][article_images_cache]`}
        value={set.article_images_cache || ''}
      />
      {/* エラーメッセージの表示 */}
      {set.errors.article_images && set.errors.article_images.map((error, errorIndex) => (
        <div key={`article_images_error_${index}_${errorIndex}`} className="text-danger">
          {error}
        </div>
      ))}

      {totalSets > 1 && index === totalSets - 1 && (
        <button type="button" onClick={onRemove} className="btn btn-danger">
          -
        </button>
      )}
    </div>
  );
};

const ArticleSets: React.FC = () => {
  // エラーメッセージの初期値を設定
  const initialSet = {
    body: '',
    article_images: null,
    article_images_cache: '',
    errors: {},
  };

  const [sets, setSets] = useState([initialSet]);

  const handleAddSet = () => {
    setSets([...sets, initialSet]);
  };

  const handleRemoveSet = (index: number) => {
    if (index === 0 && sets.length === 1) {
      return;
    }
    const newSets = [...sets];
    newSets.splice(index, 1);
    setSets(newSets);
  };

  const handleSetChange = (index: number, key: string, value: string | File | null) => {
    // エラーメッセージをリセット
    const newSets = [...sets];
    newSets[index] = { ...newSets[index], [key]: value, errors: {} };
    setSets(newSets);
  };

  return (
    <form>
      {sets.map((set, index) => (
        <SetsForm
          key={index}
          index={index}
          totalSets={sets.length}
          set={set}
          onRemove={() => handleRemoveSet(index)}
          onChange={(key, value) => handleSetChange(index, key, value)}
        />
      ))}
      <button type="button" onClick={handleAddSet} className="btn btn-primary">
        +
      </button>
    </form>
  );
};

export default ArticleSets;
