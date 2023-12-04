import React, { useEffect, useState } from 'react';

interface Content {
  id?: number;
  body: string;
  article_images: FileList | null;
  article_images_cache: string;
  _destroy?: boolean;
}

interface ArticleContentsProps {
  contents: Content[];
  body_error_message: string;
}

const ArticleContents: React.FC<ArticleContentsProps> = (props) => {
  const [contents, setContents] = useState<ArticleContentsProps['contents']>(props.contents);

  useEffect(() => {
    setContents(props.contents);
  }, [props.contents]);

  const handleChange = (index: number, field: keyof Content, value: any) => {
    const newContents: Content[] = [...contents];
    const updatedContent: Content = {
      ...newContents[index],
      [field]: field === 'article_images' ? value : value,
    };

    if (!isContentModified(updatedContent, newContents[index])) {
      return;
    }

    newContents[index] = updatedContent;
    setContents(newContents);
  };

  const isContentModified = (updatedContent: Content, existingContent: Content) => {
    return (
      updatedContent.body !== existingContent.body ||
      (updatedContent.article_images &&
        existingContent.article_images &&
        updatedContent.article_images.length !== existingContent.article_images.length)
    );
  };

  const handleAddContent = () => {
    setContents((prevContents) => [
      ...prevContents,
      { body: '', article_images: null, article_images_cache: '' },
    ]);
  };

  const handleRemoveContent = (index: number) => {
    if (contents.length > 1) {
      setContents((prevContents) => {
        const newContents = [...prevContents];
        if (newContents[index].id) {
          newContents[index] = { ...newContents[index], _destroy: true };
        } else {
          newContents.splice(index, 1);
        }
        return newContents;
      });
    }
  };

  return (
    <div>
      {contents.map((content, index) => (
        <div key={index}>
          {content.id && (
            <>
              <input type="hidden" name={`article[contents_attributes][${index}][id]`} value={content.id} />
              {content._destroy && (
                <input type="hidden" name={`article[contents_attributes][${index}][_destroy]`} value="true" />
              )}
            </>
          )}

          {content._destroy ? (
            <>
              <input type="hidden" name={`article[contents_attributes][${index}][_destroy]`} value="true" />
              <input type="hidden" name={`article[contents_attributes][${index}][id]`} value={content.id} />
            </>
          ) : (
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
              {content.body === '' && (
                <div className="text-danger">
                  <ul className="mb-0">
                    <li>{props.body_error_message}</li>
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
                  handleChange(index, 'article_images', e.target.files);
                }}
                name={`article[contents_attributes][${index}][article_images]`}
              />

              <input
                type="hidden"
                value={content.article_images_cache}
                name={`article[contents_attributes][${index}][article_images_cache]`}
              />
              
              {contents.length > 1 && (
                <button type="button" onClick={() => handleRemoveContent(index)} className="btn btn-danger">
                  -
                </button>
              )}
              <span className="text-muted small mt-2">・5MBまでの画像をアップロードできます。</span>
            </>
          )}
        </div>
      ))}

      <button type="button" onClick={handleAddContent} className="btn btn-primary">
        +
      </button>
    </div>
  );
};

export default ArticleContents;
