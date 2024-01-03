import React, { useEffect, useState } from 'react';
import RichTextEditor from './RichTextEditor';

interface Content {
  id?: number;
  body: string;
  article_image: FileList | null;
  article_image_cache: string;
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
      [field]: field === 'article_image' ? value : value,
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
      (updatedContent.article_image &&
        existingContent.article_image &&
        updatedContent.article_image.length !== existingContent.article_image.length)
    );
  };

  const handleAddContent = () => {
    setContents((prevContents) => [
      ...prevContents,
      { body: '', article_image: null, article_image_cache: '' },
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
          {content._destroy ? (
            <>
              <input type="hidden" name={`article[contents_attributes][${index}][_destroy]`} value="true" />
              <input type="hidden" name={`article[contents_attributes][${index}][id]`} value={content.id} />
            </>
          ) : (
            <>
              <input type="hidden" name={`article[contents_attributes][${index}][id]`} value={content.id} />
              <label className="form-label">内容</label>
              <span className="badge rounded-pill text-bg-danger">必須</span>
              <RichTextEditor
                value={content.body}
                onChange={(value) => handleChange(index, 'body', value)}
              />
              <input
                type="hidden"
                value={content.body}
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
                  handleChange(index, 'article_image', e.target.files);
                }}
                name={`article[contents_attributes][${index}][article_image]`}
              />

              <input
                type="hidden"
                value={content.article_image_cache}
                name={`article[contents_attributes][${index}][article_image_cache]`}
              />

              <span className="text-muted small mt-2">・5MBまでの画像をアップロードできます。</span>

              {contents.filter(content=>!content._destroy).length > 1 && (
                <div className="mt-1">
                  <button type="button" onClick={() => handleRemoveContent(index)} className="btn btn-danger">
                    -
                  </button>
                </div>
              )}
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
