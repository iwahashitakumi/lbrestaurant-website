import React, { useEffect, useState } from 'react';

interface Content {
  body: string;
  article_images: { url: string | null };
  article_images_cache: string;
  _destroy?: boolean;
}

interface Article {
  contents: Content[];
}

const ArticleContents: React.FC = (props: any) => {
  const [contents, setContents] = useState<Article['contents']>([]);

  useEffect(() => {
    const element = document.querySelector('[data-props]');
    const dataProps = element?.getAttribute('data-props');

    if (dataProps) {
      const parsedData = JSON.parse(dataProps);
      setContents(parsedData.contents || [{ body: '', article_images: { url: null }, article_images_cache: '' }]);
    }
  }, []);

  const handleChange = (index: number, field: keyof Content, value: any) => {
    setContents((prevContents) => {
      const newContents: Content[] = [...prevContents];
      newContents[index] = {
        ...newContents[index],
        [field]: field === 'article_images' ? { url: URL.createObjectURL(value[0]) } : value,
      };
      return newContents;
    });
  };

  const handleAddContent = () => {
    setContents((prevContents) => [
      ...prevContents,
      { body: '', article_images: { url: null }, article_images_cache: '' },
    ]);
  };

  const handleRemoveContent = (index: number) => {
    if (contents.length > 1) {
      setContents((prevContents) => {
        const newContents = [...prevContents];
        newContents.splice(index, 1);
        return newContents;
      });
    }
  };

  const handleError = (index: number) => {
    // エラーが発生した場合に値を保持する処理を追加
    setContents((prevContents) => {
      const newContents = [...prevContents];
      newContents[index] = {
        ...newContents[index],
        // エラーが発生したフィールドの値をデフォルト値に戻すか、適切な処理を行う
      };
      return newContents;
    });
  };

  return (
    <div>
      {contents.map((content, index) => (
        <div key={index}>
          <>
            <label className="form-label">内容</label>
            <span className="badge rounded-pill text-bg-danger">必須</span>
            <input
              type="text"
              className="form-control"
              value={content.body}
              placeholder="内容を入力"
              onChange={(e) => handleChange(index, 'body', e.target.value)}
              name={`article[contents_attributes][${index}][body]`}
            />
            {props.children}

            <label className="form-label">画像</label>
            <span className="badge rounded-pill text-bg-success">任意</span>
            <input
              type="file"
              className="form-control"
              accept="image/*"
              onChange={(e) => {
                try {
                  handleChange(index, 'article_images', e.target.files);
                } catch (error) {
                  console.error(error);
                  handleError(index);
                }
              }}
              name={`article[contents_attributes][${index}][article_images]`}
            />
            <input type="hidden" value={content.article_images_cache} name={`article[contents_attributes][${index}][article_images_cache]`} />
            <span className="text-muted small mt-2">・5MBまでの画像をアップロードできます。</span>
          </>
        </div>
      ))}
      {contents.length > 1 && (
        <button type="button" onClick={() => handleRemoveContent(index)} className="btn btn-danger">
          -
        </button>
      )}
      <button type="button" onClick={handleAddContent} className="btn btn-primary">
        +
      </button>
    </div>
  );
};

export default ArticleContents;
