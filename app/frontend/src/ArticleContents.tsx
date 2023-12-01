import React, { useEffect, useState } from 'react';

interface Content {
  body: string;
  article_images: { url: string | null };
  article_images_cache: string;
  errors?: { body?: string[]; };
}

interface Article {
  contents: Content[];
}

const ArticleContents = (props: any) => {
  const [contents, setContents] = useState<Article['contents']>([]);

  useEffect(() => {
    const initialContent: Content = {
      body: props.body || '',
      article_images: { url: props.article_images || null },
      article_images_cache: props.article_images_cache || '',
      errors: {},
    };

    setContents([initialContent]);
  }, [props.body, props.article_images, props.article_images_cache]);

  const handleChange = (index: number, field: keyof Content, value: any) => {
    setContents((prevContents) => {
      const newContents: Content[] = [...prevContents];
      newContents[index] = {
        ...newContents[index],
        [field]: field === 'article_images' ? { url: URL.createObjectURL(value[0]) } : value,
        errors: { ...newContents[index].errors, [props.attribute]: undefined },
      };
      return newContents;
    });
  };

  const handleError = (index: number, field: keyof Content, error: Error) => {
    console.error(`Error at index ${index}, field ${field}: ${error.message}`);
    
    const attribute = props.attribute;
    
    setContents((prevContents) => {
      const newContents = [...prevContents];
      newContents[index] = {
        ...newContents[index],
        errors: { ...newContents[index].errors, [attribute]: [error.message] },
      };
      return newContents;
    });
  };

  const handleAddContent = () => {
    setContents((prevContents) => [
      ...prevContents,
      { body: '', article_images: { url: null }, article_images_cache: '', errors: {} },
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
          {props.object.errors?.[props.attribute] && props.object.errors[props.attribute].length > 0 && (
            <div className="text-danger">
              <ul className="mb-0">
                {props.object.errors[props.attribute].map((message, i) => (
                  <li key={i}>{message}</li>
                ))}
              </ul>
            </div>
          )}
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
                  handleError(index, 'article_images', error);
                }
              }}
              name={`article[contents_attributes][${index}][article_images]`}
            />

            <input
              type="hidden"
              value={content.article_images_cache}
              name={`article[contents_attributes][${index}][article_images_cache]`}
            />
            <span className="text-muted small mt-2">・5MBまでの画像をアップロードできます。</span>
          </>
        </div>
      ))}
      {contents.length > 1 && (
        <button type="button" onClick={() => handleRemoveContent(contents.length - 1)} className="btn btn-danger">
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
